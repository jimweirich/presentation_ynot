p ->() {

  fp = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  y = ->(fun) {
    ->(g) { ->(n) { fun.(g.(g)).(n) } }.(
      ->(g) { ->(n) { fun.(g.(g)).(n) } })
  }

  factorial = y.(fp)
  factorial.(5)

  #  y.(fp) == fp(factorial) == factorial
  #
  # y calculates the fixpoint of a partially recursive function

}.()
