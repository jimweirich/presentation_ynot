puts ->() {

  # Fixpoints
  # Higher Order Functions
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Function Wrapping
  # (4) Inline definition
  # Refactoring

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact = ->(x) {
    x.(x)
  }.(
    ->(x) {
      ->(partial) {
        ->(n) { n.zero? ? 1 : n * partial.(n-1) }
      }
        .(->(v) { x.(x).(v) })
    }
    )

  fact.(5)

}.()
