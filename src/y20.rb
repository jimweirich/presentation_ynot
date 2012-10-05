puts ->() {

  # Fixed Point
  # Higher Order Functions
  # Refactorings:
  # (1) Tennent Correspondence Principle
  # (2) Inlining
  # Factorial is the fixed point of FIMP

  # fact = ->(n) { n.zero? ? 1 : n * fact.(n-1) }

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fimp = ->(fact) {
    ->(n) { n.zero? ? 1 : n * fact.(n-1) }
  }

  # Y-combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } ) }


  fact = y.(fimp)

  fact.(5)

}.()
