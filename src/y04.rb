p ->() {

  add1 = ->(n) { n+1 }
  dup = ->(f) { ->(n) { f.(f.(n)) } }

  add2 = dup.(add1)

  add2.(0)

}.()
