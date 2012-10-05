puts -> {

  # Functions
  # Higher Order Functions
  # Functional Refactorings
  # 1) Tennent Correspondence Principle
  # 2) Add New Binding
  # 3) Rebind
  # 4) Wrap Function
  # 5) Inline Function

  error = ->(n) { throw "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  # Z-Combinator

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  # Y calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  fact.(5)

}.()
