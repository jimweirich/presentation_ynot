puts ->() {

  error = ->(n) { throw "SHOULD NOT BE CALLED" }

  fx = ->(improver) {
    improver.(improver)
  }.(
    ->(x) {
      ->(code) {
        ->(n) { n.zero? ? 1 : n * x.(x).(n-1) }
      }.(x.(x))
    }
    )

  fx.(5)

}.()


x = ->(x) {
  f.( x.(x) )
}
