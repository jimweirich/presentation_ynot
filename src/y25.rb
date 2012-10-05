p ->() {

  # Higher Order Functions
  # Functional Refactorings
  # 1) Tennent Coorespondence Principle
  # 2) Add binding (bound and unbound)
  # 3) Inlining defintions
  # Factorial

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

  fimp = ->(f) {
    ->(n) { n.zero? ? 1 : n * f.(n-1) }
  }

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fimp)

  fact.(5)

}.()
