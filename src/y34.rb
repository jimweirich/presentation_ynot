puts ->() {

  # Fixpoints:   x = f.(x)
  # Higher Order Functions
  # Functional Refactorings
  # (1) Tennant Correspondence Principle
  # (2) Introduce Binding
  # (3) Rebind
  # (4) Wrap Function
  # (5) Inline Definition
  # Recursion

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  # (Z-Combinator)
  y = ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) }) }.(
    ->(x) { f.(->(v) { x.(x).(v) }) } )
  }

  Y = ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) } ) }.(
    ->(x) { f.(->(v) { x.(x).(v) } ) } )
  }
  # Y Calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  # fact = fact_improver.(fact)
  # fact is the fixpoint of fact_improver

  fact.(5)

}.()
