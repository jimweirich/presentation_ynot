# -*- coding: utf-8 -*-
# λf. (λx. f (λy. x x y)) (λx. f (λy. x x y))

z = ->(fun) {
  ->(f) {
    fun.( ->(n) { f.(f).(n) } )
  }.(
    ->(f) {
      fun.(->(n) { f.(f).(n) })
    }
    )
}

fp = ->(recur) {
  ->(n) { n==0 ? 1 : n * recur.(n-1) }
}

fact = z.(fp)

p fact.(5)
