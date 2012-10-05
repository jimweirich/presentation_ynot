puts ->() {

  # Applicative Order Y-Combinator...

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fp = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  fact = y.(fp)

  fact.(5)

}.()
