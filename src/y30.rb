puts ->() {

  # Fixpoint
  # Higher Order Functions
  # Function Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Rebinding
  # (4) Wrap Function
  # (5) Inline Functions
  # Recursion

  error = ->(n) { throw "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) {
      n.zero? ? 1 : n * partial.(n-1)
    }
  }

  # The Applicative Order Y-Combinator (AKA Z-Combinator)
  # Y calculates the Fixpoint of an improver function
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fact_improver)

  # Fact is the fix point of the fact improver
  fact_improver.(fact) => fact

  fact.(5)

}.()
