# = Tennent Correspondence Principle
#
# You can wrap any expression in a lambda, then immediately call it with no
# change in result.

    ->(n) { n + 1 }             # BEFORE
    ->(n) { ->() { n + 1 }.() } # AFTER

# = Introduce Binding
#
# You can add a free variable to any function argument list and then
# bind it to anything without changing the result.

    ->(n) { ->() { n + 1 }.() } # BEFORE
    ->(n) { ->(x) { n + 1 }.(anything) } # AFTER

# = Rebind
#
# You can add an already bound variable name as long as you initialize
# it with the bound value.

    ->(n) { ->() { n + 1 }.() } # BEFORE
    ->(n) { ->(n) { n + 1 }.(n) } # AFTER

# = Function Definition Inlining
#
# You can replace a named function with it definition.

    add1 = ->(n) { n + 1 }      # BEFORE
    add1.(10)

    (->(n) { n + 1 }).(10)      # AFTER

