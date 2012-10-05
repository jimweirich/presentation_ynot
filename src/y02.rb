p ->(number) {

  y = ->(fun) {
    ->(g) {
      fun.(g.(g))
    }.(
      ->(g) {
        ->(n) {
          fun.(g.(g)).(n)
        }
      }
      )
  }

  fact_partial = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  fact_partial.(fact_partial.(y.(fact_partial))).(number)

}.(5)
