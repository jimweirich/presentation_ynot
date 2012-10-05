require 'awesome_print'
require 'letters'

class Object
  @__then__ = nil

  def self.__then__
    @__then__
  end

  def self.__then__=(value)
    @__then__ = value
  end

  def T(options={})
    if options[:message] || options[:msg]
      label = "#{options[:message] || options[:msg]} "
    else
      label = ""
    end

    now = Time.now
    printf "#{label}Delta-T %0.3f msecs\n", 1000*(now-Object.__then__) if Object.__then__
    Object.__then__ = now
    self
  end

  def dbg(options=nil)
    case options
    when String
      print options
    when Hash
      print options[:message] || options[:msg]
    else
      print "DBG: "
    end
    self
  end
end

ap ->() {

  # Fixpoints
  # Higher Order Functions
  # Funtional Refactoring
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Wrap Function
  # (4) Inline Definition
  # Recursion

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Fixpoint Combinator
  # Applicative Order Y-Combinator
  # Z-Combinator
  # (Pages 160-172 of the Little Schemer)
  y =

  # Y calculates the fixpoint of an improver function
  ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) } ) }.(
    ->(x) { f.(->(v) { x.(x).(v) } ) } )
  }.T.(fact_improver).dbg.T(msg: "BUILD").(1000).dbg.T(msg: " CALC")

}.()
