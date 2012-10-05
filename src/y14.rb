puts ->() {

  cos = Math.method(:cos)

  x = 0
  100.times { x = cos.(x) }
  x

}.()
