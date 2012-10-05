puts lambda {

  # Higher Order Functions
  # Functional Refactorings
  # 1) Tennent Correspondence Principle
  # 2) Introduce Binding
  # 3) Rebind
  # 4) Function Wrapping
  # 5) Inlining

  error = ->(n) { fail "SHOULD NOT CALL" }

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact_improver = ->(partial) { 
    ->(n) { n.zero? ? 1 : n * partial.(n-1) } 
  }

  fact = y.(fact_improver)

  fact.(5)

}.()
