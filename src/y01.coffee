console.log (() ->

  error = (n) -> throw Error("SHOULD NEVER CALL")

  (((fimp) -> fimp(fimp))( ((fp) -> (n) -> if n==0 then 1 else n * fp(fp)(n-1)) ))(5)

  )()
