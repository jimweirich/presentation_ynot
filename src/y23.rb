p ->() {

  # Fixpoint: fix = fun(fix)
  # Higher Order Functions
  # Functional Refactorings
  # * Tennent's Correspondence Principle
  # * Introduce Binding
  # * Inline Definition

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fimp = ->(fp) {
    ->(n) {
      n.zero? ? 1 : n * fp.(n-1)
    }
  }

  # Applicative Order Y Combinator

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  # Normal Order Y Combinator

  y = ->(f) {
    ->(g) { f.(g.(g)) }.(
    ->(g) { f.(g.(g)) } )
  }

  fact = y.(fimp)

  fact.(5)

}.()
