puts ->() {

  # ->(n) { n==0 ? 1 : n*fact.(n-1) }.(5)

  error = ->(n) { fail "can't calculate value" }

  fp = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  factorial = y.(fp)

  factorial.(5)

}.()
