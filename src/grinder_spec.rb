require 'rspec-given'
require 'grinder'

describe Grinder::LexLex do
  Given(:lexer) { Grinder::LexLex.new }
  Then { lexer.lex("Lxx").should == %w[L x x] }
  Then { lexer.lex("L x   x").should == %w[L x x] }
  Then { lexer.lex("f ONE IS_ZERO F1").should == %w[f ONE IS_ZERO F1] }
end


describe Grinder::Parser do
  Given(:definitions) { { } }
  Given(:parser) { Grinder::Parser.new }
  Given(:result) { lex_result.to_s }

  When(:lex_result) {
    definitions.each do |name, value|
      parser.define(name, value)
    end
    parser.parse(source)
  }

  context "with a function definition" do
    Given(:source) { ":x x" }
    Then { result.should == "(fun x x)" }
  end

  context "with a parenthesized expression" do
    Given(:source) { "(:x x)" }
    Then { result.should == "(fun x x)" }
  end

  context "with a variable" do
    Given(:source) { "x" }
    Then { lex_result.should be_a Grinder::Var }
    Then { result.should == "x" }
  end

  context "with a function application" do
    Given(:source) { "(:x x):x x" }
    Then { result.should == "(apply (fun x x) (fun x x))" }
  end

  context "with macros" do
    Given(:definitions) {
      { "ONE" => ":f:v fv" }
    }
    Given(:source) { "ONE" }
    Then { result.should == "(fun f (fun v (apply f v)))" }
  end

  context "with macros" do
    Given(:source) { ":a:b:c abc" }
    Then { result.should == "(fun a (fun b (fun c (apply (apply a b) c))))" }
  end
end

describe "Evaluation" do
  describe "of functions" do
    Given(:source) { ":x x" }
    When(:result) { Grinder.evaluate(source).to_s }
    Then { result.should == "[(fun x x) @ ()]" }
  end
  describe "of applications" do
    Given(:source) { "(:x x) :x x" }
    When(:result) { Grinder.evaluate(source).to_s }
    Then { result.should == "[(fun x x) @ ()]" }
  end
  describe "of numbers" do
    Given(:definitions) {
      {
        "TWO" => ":f:v f(fv)",
        "INC" => ":n:f:v f(nfv)"
      }
    }
    Given(:source) { "INC TWO" }
    When(:result) {
      definitions.each do |name, string|
        Grinder.define(name, string)
      end
      Grinder.evaluate(source).to_s
    }

    Then { result.should == "[(fun f (fun v (apply f (apply f v)))) @ ()]" }
  end
end

describe "as_int primitive" do
  Given(:lex) { Grinder.evaluate(source) }
  When(:result) { Grinder.as_int(lex) }

  context "for zero" do
    Given(:source) { ":f:v v" }
    Then { result.should == 0 }
  end

  context "for one" do
    Given(:source) { ":f:v fv" }
    Then { result.should == 1 }
  end

  context "for two" do
    Given(:source) { ":f:v f(fv)" }
    Then { result.should == 2 }
  end
end
