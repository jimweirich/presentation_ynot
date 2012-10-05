puts ->() {

  # Fixpoints
  # Higher Order Functions
  # Refactoring:
  # (1) Tennent Correspondence Principle
  # (2) Inlining

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fimp = ->(f) {
    ->(n) {
      n.zero? ? 1 : n * f.(n-1)
    }
  }

  # Y combinator caculates the fixpoint of FIMP

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
    }

    # Lf.(Lg.Ln.(f g g)n) Lg.Ln.(f g g)n)

  # Lx.x => [x x]
  # Lf.Lx.L

  fact = y.(fimp)

  fact.(5)

}.()
