puts ->() {

  error = ->(n) { fail "That does not compute" }

  # GOAL: fact = fixpoint_of.(fp)

  fpart = ->(fp) {
    ->(n) { n==0 ? 1 : n*fp.(n-1) }
  }

  # Applicative Order Y-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fpart)

  fact.(5)

}.()
