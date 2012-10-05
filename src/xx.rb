add1 = ->(n) { n+1 }
compose = ->(f, g) { ->(x) { f.(g.(x)) } }
doubleup = ->(f) { compose.(f,f) }
selfcall = ->(g) { g.(g) }

fact_maker = ->(f) { ->(n) { (n==0) ? 1 : n * f.(n-1) } }

fact = ->(g) { g.(g) }.(fact_maker)
p fact.(0)

__END__

p ->(n) {

  ->(g) {
    g.(g.(nil))
  }.(
    ->(f) {
      ->(n) { (n == 0) ? 1 : n * f.(n-1) }
    }
    ).(n)

}.(ARGV.first.to_i)
