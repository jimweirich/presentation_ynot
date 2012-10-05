// Higher Order Functions
// Functional Refactoring
// (1) Tennentt Correspondence Principle
// (2) Introduce new binding
// (3) Rebind existing binding
// (4) Inline function definition

error = function(n) { throw Error("SHOULD NOT BE CALLED") }

fact_improver = function(partial) {
  return function(n) {
    return n==0 ? 1 : n * partial(n-1)
  }
}

y = function(g) {
  return function(f) { return function(n) { return g(f(f))(n) } }(
         function(f) { return function(n) { return g(f(f))(n) } })
}

fact = y(fact_improver)

result = fact(5)

console.log(result);
