p ->() {

  # fact, fn, fx:      (n): n
  # fp                 (fx): fx+1
  # fg                 (fg): fact
  #

  error = ->(n) { throw "SHOULD NOT BE CALLED" }

  fpart = ->(fp) { ->(n) { n.zero? ? 1 : n * fp.(n-1) } }

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fact = y.(fpart)

  fact.(5)

}.()
