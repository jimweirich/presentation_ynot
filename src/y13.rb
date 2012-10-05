puts ->() {

  # (1) Fix Point
  # (2) Higher Order Functions
  # (3) Refactorings:
  #     * Inline Function
  #     * Function Wrapping

  error = ->(n) { fail "OUCH" }

  # Applicative Order Y Combinator

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact_partial = ->(fp) {
    ->(n) { n == 0 ? 1 : n * fp.(n-1) }
  }

  fact = y.(fact_partial)

  fact.(5)




  Something.new.tap { |x|
    x.set_x = blah
  }

  returning(val) { |x|
    x == val
  }

  Given(:thing) {
    result = mock
    result.should_receive(:thing).and_return(nil)
    result
  }





}.()
