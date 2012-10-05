

make_adder = function(x) {
  return function(n) {
    return x + n
  }
}

make_adder = function(x) {
  return function(n) {
    return function(n) {
      return x + n
    }(n)
  }
}

result = make_adder(1)(10)


console.log(result)
