p ->() {

  error = ->(n) { fail "That does not compute" }

  # GOAL: fact = y.(fp)

  # Applicative Order Y Combinator
  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  ifelse = ->(cond,tval,fval) { cond ? tval.() : fval.() }

  fpart = ->(recur) {
    ->(n) { ifelse.(n==0, ->{ 1 }, ->{n*recur.(n-1)}) }
  }

  fact = y.(fpart)

  fact.(5)
}.()
