p ->() {

  # Fix Points
  # Higher Order Functions
  # Refactorings
  # - Inline
  # - Tennent Correspondence Principle
  # Factorial is the fixpoint of FIMP

  # ->(n) { n.zero? ? 1 : n * fact.(n-1) }.(5)

  ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
      ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }.(->(f) {
      ->(n) { n.zero? ? 1 : n * f.(n-1) }
    }).(5)

}.()
