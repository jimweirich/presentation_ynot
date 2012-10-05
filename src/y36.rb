puts ->() {

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  y = ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) } ) }.(
    ->(x) { f.(->(v) { x.(x).(v) } ) } )
  }

  fact = y.(fact_improver)

  fact.(5)

}.()
