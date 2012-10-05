console.log (->

  error = (n) -> throw Error("SHOULD NOT CALL")

  fgen = (fp) ->
    (n) ->
      if n==0 then 1 else n * fp(n-1)

  y = (f) ->
    ((g) -> (n) -> f(g(g))(n) ) (
     (g) -> (n) -> f(g(g))(n) )

  fx = y(fgen)

  fx(5)

)()
