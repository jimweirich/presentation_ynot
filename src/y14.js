console.log(function(){

  // Fixpoints
  // Higher Order Function
  // Functional Refactoring
  // (1) Tennent Correspondence Principle
  // (2) Introduce Binding
  // (3) Rebind
  // (4) Function Wrap
  // (5) Inline Functio

  error = function(n) { throw Error("SHOULD NEVER BE CALLED") }

  fact_improver = function(partial) {
    return function(n) {
      return n==0 ? 1 : n * partial(n-1)
    }
  }

  // Y Calculates the FIXPOINT of an improver function
  // Applicative Order Y Combinator

  y = function(f) {
    return function(g) { return function(n) { return f(g(g))(n) } } (
           function(g) { return function(n) { return f(g(g))(n) } }
    )
  }

  fib_improver = function(partial) {

  fact = y(fact_improver)

  return fact(5)

}())
