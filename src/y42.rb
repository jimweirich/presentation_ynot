puts ->() {

  # Fixpoints
  # Higher Order Functions
  # * take functions as arguments
  # * return functions as values
  # Functional Refactorings
  # (1) Tennent Correspondence Principle
  # (2) Introduce Binding
  # (3) Wrap Function
  # (4) Inline Definition
  # Recursion

  error = ->(n) { throw "SHOULD NOT BE CALLED" }

  fact_improver = ->(partial) {
    ->(n) { n.zero? ? 1 : n * partial.(n-1) }
  }

  # Applicative Order Y-Combinator
  y = ->(f) {
    ->(x) { f.( ->(v) { x.(x).(v) } ) }.(
    ->(x) { f.( ->(v) { x.(x).(v) } ) } )
  }

  # Y Calculates the fixpoint of an improver function
  fact = y.(fact_improver)

  # fact is the fixpoint of the fact_improver
  fact = fact_improver.(fact)

  fact.(5)

}.()
