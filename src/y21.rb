puts ->() {

  # Higher Order Functions
  # Refactorings:
  # (1) Tennent Correspondence Principle
  # (2) Substitution

  # Factorial is the fixpoint of FIMP

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fimp = ->(fact) {
    ->(n) { n.zero? ? 1 : n * fact.(n-1) }
  }

  # Y-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fimp)

  fact.(5)

}.()
