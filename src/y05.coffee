console.log (->

  error = (n) -> throw Error("SHOULD NOT BE CALLED")

  fx = (
    () -> (((gen) -> gen(gen)) (
      (gen) -> (n) -> ((partial) -> ((n) -> if n==0 then 1 else n*partial(n-1)))(gen(gen))(n)
    ))()

  fx(5)

  )()
