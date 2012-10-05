puts ->() {

  error = ->(n) { fail "SHOULD NEVER BE CALLED" }

  fimp = ->(fp) {
    ->(n) { n.zero? ? 1 : n * fp.(n-1) }
  }

  # Applicative Order Y-Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  # Y calculates the fixpoint of fimp

  fact = y.(fimp)

  fact.(5)

}.()
