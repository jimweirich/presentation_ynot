p ->() {

  # Fixpoint
  # Higher Order Function
  # Functional Refactorings
  # * Tennent's Correspondence Principle
  # * Introduce Binding (free/bound)
  # * Inline Definition
  # Partial Functions

  error = ->(n) { fail "SHOULD NOT CALL" }

  y = ->(f) {
    ->(g) { g.(g) }.(
      ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact_improver = ->(fp) { ->(n) { n.zero? ? 1 : n * fp.(n-1) } }

  # Y calculates the fix point of an improver function

  fact = y.(fact_improver)

  # fact is the Fixpoint of fact_improver

  fact = fact_improver.(fact)

  fib_improver = ->(fib_partial) {
    ->(n) { n <= 1 ? 1 : fib_partial.(n-2) + fib_partial.(n-1) }
  }

  fib = y.(fib_improver)

  (0..10).each do |i| puts fib.(i) end

}.()
