
# Y Combinator Demo in CoffeeScript
#
#   Run with: coffee y.coffee

p = console.log

fact = (f) ->
  (n) ->
    if n==0
      1
    else
      n*f(n-1)

y = (fun) ->
  ((g) -> g(g)) (g) ->
    (n) ->
      fun(g(g))(n)

p y(fact)(0)
p y(fact)(5)
p y(fact)(10)
p y(fact)(100)
