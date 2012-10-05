console.log(function() {

  // Fixpoints
  // Higher Order Functions
  // Functional Refactorings
  // (1) Tennent Correspondence Principle
  // (2) Introduce Binding
  // (3) Rebinding
  // (4) Function Wrapping
  // (5) Inline Function

  error = function(n) { throw Error("SHOULD NOT CALL") }

  improver = function(partial) {
    return function(n) {
      return n==0 ? 1 : n * partial(n-1)
    }
  }

  y = function(f) {
    return function(g) { return function(n) { return f(g(g))(n) } }(
           function(g) { return function(n) { return f(g(g))(n) } }
    )
  }

  fx = y(improver)

  return fx(5)

}())
