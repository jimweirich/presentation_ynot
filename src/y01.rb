lambda { }

p ->(number) {

  y = ->(fun) {
    ->(g) { g.(g) }.(
      ->(g) {
        ->(n) {
          fun.(g.(g)).(n)
        }
      }
      )
  }

  fact_fun = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  y.(fact_fun).(number)

}.(5)
