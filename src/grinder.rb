# ZERO: :f.:v.v
# ONE:  :f.:v.fv
# TWO:  :f.:v.ffv
# @int ONE
# ID: Lx.x
# ID ONE

module Grinder

  module Trace
    def clear_trace
      @@level = 0
    end
    def level
      @@level ||= 0
    end
    def indent
      "  " * level
    end
    def trace(name, obj, context, &block)
      puts "TRACE #{indent}#{name} ON #{obj} IN #{context}"
      @@level += 1
      result = block.call
      @@level -= 1
      puts "TRACE #{indent}#{name} RETURNS #{result}"
      result
    end
  end

  class << self
    include Trace
  end

  def self.parser
    @parser ||= Parser.new
  end

  def self.evaluate(string)
    clear_trace
    lex = parser.parse(string)
    lex.evaluate(EMPTY_CONTEXT)
  end

  def self.define(name, string)
    parser.define(name, string)
  end

  def self.as_int(lex_n)
    pzero = Primitive.new("ZERO", 0)
    pinc = Primitive.new("INC") { |v| v + 1 }
    lex = Application.new(
      Application.new(lex_n, pinc),
      pzero)
    trace("ASINT", lex, EMPTY_CONTEXT) do
      lex.evaluate(EMPTY_CONTEXT)
    end
  end

  class LexLex
    def lex(string)
      string.scan(/[A-Z][A-Z0-9_]+|./).reject { |item| item =~ / +/ }
    end
  end

  class Context
    def initialize(var, value, parent)
      @var = var.name
      @value = value
      @parent = parent
    end
    def bind(var, value)
      Context.new(var, value, self)
    end
    def lookup(variable)
      @var == variable ? @value : @parent.lookup(variable)
    end
    def to_s
      result = "(#{@var}:#{@value} #{@parent})"
    end
  end

  class EmptyContext < Context
    def initialize
    end
    def lookup(var)
      fail "Unbound variable #{var}"
    end
    def to_s
      "()"
    end
  end

  EMPTY_CONTEXT = EmptyContext.new

  class Var
    attr_reader :name
    def initialize(name)
      @name = name
    end
    def evaluate(context)
      puts "DBG: VAR.EVAL IN #{context}\n         SELF=#{self.inspect}"; x =
      context.lookup(name)
      puts "DBG:     RETURN=#{x}"; x
    end
    def to_s
      name
    end
  end

  class Closure
    def initialize(function, context)
      @function = function
      @context = context
    end
    def evaluate(context)
      self
    end
    def apply(value, context)
      value.evaluate(@context)
    end
    def to_s
      "[#{@function} @ #{@context}]"
    end
  end

  class Func
    include Trace
    def initialize(var, body)
      @var = var
      @body = body
    end
    def to_s
      "(fun #{@var} #{@body})"
    end
    def evaluate(context)
      trace("F.EVAL", self, context) {
        Closure.new(self, context)
      }
    end
    def apply(value, context)
      puts "DBG: FUN.APPLY(#{value}) IN #{context}\n         SELF=#{self.inspect}"
      new_context = context.bind(@var, value)
      @body.evaluate(new_context)
    end
  end

  class Primitive
    def initialize(name, value=nil, &block)
      @name = name
      @value = value
      @block = block
    end
    def evaluate(context)
      @value || self
    end
    def apply(value, context)
      puts "DBG: PRI.APPLY(#{value}) IN #{context}\n         SELF=#{self.inspect}"; x =
      @value ? @value : @block.call(value)
      puts "DBG:     RETURN=#{x}"; x
    end
    def to_s
      "<#{@name}>"
    end
  end

  class Application
    include Trace

    def initialize(function, arguement)
      @function = function
      @arguement = arguement
    end

    def evaluate(context)
      trace("A.EVAL", self, context) do
        puts "DBG: @function=#{@function.inspect}"
        f = @function.evaluate(context)
        puts "DBG: f=#{f.inspect}"
        f.apply(@arguement, context)
      end
    end

    def to_s
      "(apply #{@function} #{@arguement})"
    end
  end

  # LEX = APPLICATION | ATOM
  # ATOM = VAR | FUN | PARENS
  # VAR = a..z
  # FUN = :var.LEX
  # PARENS = (LEX)
  # APPLICATION = LEX ATOM

  class Parser
    def initialize
      @definitions = {}
    end

    def parse(string)
      string = expand_macros(string)
      tokens = lexer.lex(string)
      parse_lex(tokens)
    end

    def define(name, string)
      @definitions[name] = string
    end

    private

    def expand_macros(string)
      result = string
      while result =~ /([A-Z0-9_]+)/
        name = $1
        definition = @definitions[name]
        fail "No definition for #{name}" if definition.nil?
        result = result.gsub(/\b#{name}\b/, "(#{definition})")
      end
      result
    end

    def parse_lex(tokens)
      ttt = tokens.dup
      if ! start_of_atom?(tokens.first)
        fail "Expected start of atom at #{tokens.join}"
      end

      result = parse_atom(tokens)
      while start_of_atom?(tokens.first)
        atom = parse_atom(tokens)
        result = Application.new(result, atom)
      end
      result
    end

    def parse_atom(tokens)
      tok = tokens.first
      if tok == "("
        parse_parens(tokens)
      elsif tok == ":"
        parse_func(tokens)
      elsif variable?(tok)
        parse_var(tokens)
      end
    end

    def parse_parens(tokens)
      skip_tok("(", tokens)
      result = parse_lex(tokens)
      skip_tok(")", tokens)
      result
    end

    def parse_func(tokens)
      skip_tok(":", tokens)
      var = parse_var(tokens)
      body = parse_lex(tokens)
      Func.new(var, body)
    end

    def parse_var(tokens)
      fail "Expected variable, got '#{tokens.first}'" if tokens.first !~ /^[a-z]$/
      Var.new(tokens.shift)
    end

    def variable?(token)
      token =~ /^[a-z]$/
    end

    def start_of_atom?(token)
      token == "(" ||
        token == ":" ||
        token =~ /^[a-z]$/
    end

    def skip_tok(string, tokens)
      if string == tokens.first
        tokens.shift
      else
        fail "Expected '#{string}', but got '#{tokens.first}'"
      end
    end

    def lexer
      @lexer = LexLex.new
    end
  end
end
