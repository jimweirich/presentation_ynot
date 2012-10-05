p ->() {

  error = ->(n) { fail "SHOULD NOT CALL" }

  fp = ->(fact) {
      ->(n) { n.zero? ? 1 : n * fact.(n-1) }
    }

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  y.(fp).(5)

}.call()
