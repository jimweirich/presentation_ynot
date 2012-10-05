console.log(
  function() {

    // 1) Tenent Correspondence Principle
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

    // Applicative Order Y Combinator (canonical)
    // Calculates the FIXPOINT of an improver function
    y = function(f) {
      return function(g) { return function(n) { return f(g(g))(n) } } (
             function(g) { return function(n) { return f(g(g))(n) } } )
    }

    fact = y(fact_improver)

    return fact(5)

  }()
)
