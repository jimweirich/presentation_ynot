puts ->() {

  # Fixpoints
  # Higher Order Functions
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Wrap Function
  # (4) Inline Definition
  # Recursion

  error = ->(n) { fail "SHOULD NOT BE CALLED" }


  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Fixpoint combinator
  # Applictive Order Y Combinator
  y = ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) } ) }.(
    ->(x) { f.(->(v) { x.(x).(v) } ) } )
  }

  # Y Calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  # fact is the fixpoint of fact_improver
  fact = fact_improver.(fact)

  fact.(5)

}.()
