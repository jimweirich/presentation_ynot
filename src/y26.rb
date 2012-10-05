p ->() {

  # Higher Order Functions
  # Functional Refactorings
  # * Tennent Coorespondence Principle
  # * Introduce Binding
  # * Inlining definitions

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

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

  fact = y.(fimp)

  fact = fimp.(fact)

  fact.(5)

}.()
