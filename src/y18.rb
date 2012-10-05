puts ->() {

  # Fixpoints
  # Higher Order Functions
  # Refactorings:
  # (1) Tennent Correspondence Principle
  # (2) Inlining

  # ->(n) { n.zero? ? 1 : n * fact.(n-1) }.(5)

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

  fimp = ->(f) {
    ->(n) { n.zero? ? 1 : n * f.(n-1) }
  }

  # Applicative Order Y-Combinator

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fimp)

  fact.(5)

}.()
