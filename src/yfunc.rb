p ->(n) {
  ->(y, f) {
    y.(f).(n)
  }.(
    ->(make) {
      ->(f) { f.(f) }.(
        ->(f) {
          make.(->(x) { f.(f).(x) })
        })
    },
    ->(recurse) {
      ->(n) {
        (n==0) ? 1 : n * recurse.(n-1)
      }
    })
}.(5)
