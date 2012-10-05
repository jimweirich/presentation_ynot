puts ->() {

  # Fixpoint
  # Higher order functions
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Rebind
  # (4) Wrap Function
  # (5) Inline Definition
  # Recursion

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fact_improver)

  # fact = fact_improver.(fact)
  # x = f.(x)
  # Fact is the fixpoint of fact_improver
  # Y calculates the fixpoint of an improver function

  fact.(5)

}.()
