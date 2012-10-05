console.log(function() {

  // 1) Tennent Correspondence Principle
  // 2) Introduce Binding
  // 3) Rebind
  // 4) Wrap Function
  // 5) Inline Function

  error = function(n) { throw Error("SHOULD NOT BE CALLED") }

  fact_improver = function(partial) {
    return function(n) {
      return n == 0 ? 1 : n * partial(n-1)
    }
  }

  // Y Combinator - Applicative Order
  // Calculates the FIXPOINT of an improver function
  y = function(f) {
    return function(g) { return function(n) { return f(g(g))(n) } } (
           function(g) { return function(n) { return f(g(g))(n) } } )
  }

  fact = y(fact_improver)

  // fact_improver(fact) ==> fact

  return fact(5)

}())

