puts ->() {

  # Higher Order Functions
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Rebind
  # (4) Wrap Function
  # (5) Inline Definition
  # Fixpoints

  error = ->(n) { raise "SHOULD NEVER BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  # (Z-Combinator)
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  # fact_improver.(fact)  ===> fact
  # Fact is the FIXPOINT of fact_improver.

  # Y calculates the FIXPOINT of an improver function.
  fact = y.(fact_improver)

  fact.(5)

}.()
