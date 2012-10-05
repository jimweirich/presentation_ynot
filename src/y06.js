// Fixpoints
// Higher Order Functions
// Functional Refactorings
// (1) Tennent's Correspondence Principle
// (2) Introduce Binding
// (3) Rebind Binding
// (4) Inline Function

error = function(n) { throw Error("SHOULD NOT BE CALLED") }

fact_improver = function(partial) {
  return function(n) {
    return n == 0 ? 1 : n * partial(n-1)
  }
}

y = function(f) {
  return function(g) { return function(n) { return f(g(g))(n) } } (
         function(g) { return function(n) { return f(g(g))(n) } } )
}

fact = y(fact_improver)

result = fact(5)

console.log(result)
