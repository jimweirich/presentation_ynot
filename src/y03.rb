# -*- coding: utf-8 -*-
p ->(number) {

  error = 0

  # Y = λf.(λx.f (x x)) (λx.f (x x))

  y = ->(improver) {
    ->(gen) { ->(n) { improver.(gen.(gen)).(n) } }.(
    ->(gen) { ->(n) { improver.(gen.(gen)).(n) } } )
  }

  fact_improver = ->(partial) {
    ->(n) { n==0 ? 1 : n * partial.(n-1) }
  }

  fact = y.(fact_improver)

  fact.(number)
}.(5)
