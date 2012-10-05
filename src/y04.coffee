
console.log (->

  # Fixpoint
  # Higher Order Functions
  # Refactorings
  # * Tennent Correspondence Princple (w/param)
  # * Inlining

  error = (n) -> throw Error("SHOULD NOT BE CALLED")

  fact_improver = (partial) -> ((n) -> if n==0 then 1 else n * partial(n-1))

  y = (f) ->
    ( (g) -> (n) -> f(g(g))(n) ) (
      (g) -> (n) -> f(g(g))(n) )

  fact = y(fact_improver)

  fact(5)

)()
