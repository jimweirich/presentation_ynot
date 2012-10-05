puts ->() {

  error = ->(n) { fail "That does not compute" }

  # Applicative Order Y-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact_partial = ->(recur) {
    ->(n) { n==0 ? 1 : n*recur.(n-1) }
  }

  fact = y.(fact_partial)

  fact.(5)

}.()
