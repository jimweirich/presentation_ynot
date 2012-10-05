puts ->() {

  # Fixpoint
  # Higher Order Functions
  # Functional refactorings
  # (1) Tennent Coorespondence Principle
  # (2) Introduce Binding
  # (3) Rebind
  # (4) Wrap function
  # (5) Inline Definition
  # Recursive Functions

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  # Z-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fact_improver)

  fact.(5)

}.()
