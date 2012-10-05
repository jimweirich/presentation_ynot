console.log(function() {

  // Fixpoints
  // Higher Order Functions
  // Functional Refactorings
  // (1) Tennent Correspondence Principle
  // (2) Introduce Binding
  // (3) Rebind
  // (4) Function Wrapping
  // (5) Inline Function

  error = function(n) { throw Error("SHOULD NOT BE CALLED") }

  fact_improver = function(partial) {
    return function(n) {
      return n==0 ? 1 : n * partial(n-1)
    }
  }

  // Applicative Order Y Combinator

  y = function(f) {
    return function(g) { return function(n) { return f(g(g))(n) } } (
           function(g) { return function(n) { return f(g(g))(n) } } )
  }

  fact = y(fact_improver)

  // fact_improver(fact) ==> fact

  // Fact is the FIXPOINT of fact_improver
  // Y Calculates the FIXPOINT of an improver function

  return fact(5)

}())
