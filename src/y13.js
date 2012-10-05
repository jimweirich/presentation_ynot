console.log(function() {

  // Refactorings
  // (1) Tennent Correspondence Principle
  // (2) Introduce Binding
  // (3) Rebind
  // (4) Function Wrapping
  // (5) Function Inlining

  error = function(n) { throw Error("SHOULD NOT CALL") }

  fact_improver = function(partial) {
    return function(n) {
      return n==0 ? 1 : n * partial(n-1)
    }
  }

  // Y solves for the fixpoint of an improver function
  // Y Combinator
  y = function(f) {
    return function(g) { return function(n) { return f(g(g))(n) } } (
           function(g) { return function(n) { return f(g(g))(n) } } )
  }

  // fact is the fix point of fact_improver

  fact = y(fact_improver)

  return fact(5)

}())
