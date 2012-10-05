puts ->() {

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator (Z-Combinator)
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
