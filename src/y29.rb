puts ->() {

  # Fixpoints
  # Higher order Functions
  # Functional Refactorings
  # 1) Tennent Correspondence Principle
  # 2) Introduce Binding
  # 3) Rebind
  # 4) Function Wrapping
  # 5) Inline Function

  error = ->(n) { throw "SHOULD NOT CALL" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  # Z-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  # Y-Combinator calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  # Fact is the fixpoint of the fact_improver
  fact = fact_improver.(fact)

  fact.(5)

}.()
