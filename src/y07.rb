# (1) Fix Points of Functions
# (2) Higher Order Functions
#     - Function arguments
#     - Function return values
#     - Function transforming
#     - Function expressions
#     - Function Replacement
# (3) Lambda Calculus
# (4) Partial Functions
# (5) Fix Point Solution for Partial Functions

p ->() {

  fp = ->(fact) {
    ->(n) { n==0 ? 1 : n*fact.(n-1) }
  }

  y = ->(f) {
    ->(g) { f.(g.(g)) }.(
    ->(g) { f.(g.(g)) } )
  }

  y.(fp).(5)

}.()

