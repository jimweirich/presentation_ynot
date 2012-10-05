puts ->() {

  # Fixpoint
  # Higher Order Function
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Wrap Function
  # (4) Inline definition
  # Recursion

  error = ->(n) { fail "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y Combinator (Z COmbinator)
  y = ->(f) {
    ->(x) { f.(->(v) { x.(x).(v) }) }.(
    ->(x) { f.(->(v) { x.(x).(v) }) } )
  }

  # Y calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  # Fact is the fixpoint of the fact_improver
  fact = fact_improver.(fact)

  fact.(5)

}.()
