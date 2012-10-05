# -*- coding: utf-8 -*-
p ->() {

  zero = ->(f) { ->(x) { x } }
  one  = ->(f) { ->(x) { f.(x) } }
  two  = ->(f) { ->(x) { f.(f.(x)) } }

  to_i = ->(cn) { cn.(->(n) { n + 1 }).(0) }
  to_i.(zero)

  plus = ->(m) { ->(n) {
      ->(f) {
        ->(x) {
          m.(f).(n.(f).(x))
        }
      }
    }
  }

  to_i.(plus.(one).(two))

  c = Math.method(:cos)
  (0...91).inject(1) { |s, n| c.(s) }

}.();
