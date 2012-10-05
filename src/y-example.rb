p ->() {

  # Fix-point of a function
  # Higher Order Function
  # Functional Refactorings
  # * Inlining
  # * Wrapping
  # * Call Extraction

  error = ->(n) { fail "SHOULD NOT CALL" }

  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) { n.zero? ? 1 : n * g.(g).(n-1) }
  #   }
  #   ).(5)

  # Wrap with integer function
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(n) { n.zero? ? 1 : n * g.(g).(n-1) }.(n)
  #     }
  #   }
  #   ).(5)

  # Wrap with code
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(code) {
  #         ->(n) { n.zero? ? 1 : n * g.(g).(n-1) }.(n)
  #       }.(error)
  #     }
  #   }
  #   ).(5)

  # Pass in g.(g) instead of error
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(code) {
  #         ->(n) { n.zero? ? 1 : n * g.(g).(n-1) }.(n)
  #       }.(g.(g))
  #     }
  #   }
  #   ).(5)

  # Replace g.(g) with code
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(code) {
  #         ->(n) { n.zero? ? 1 : n * g.(g).(n-1) }.(n)
  #       }.(g.(g))
  #     }
  #   }
  #   ).(5)

  # Replace g.(g) with code (and rename to f)
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(f) {
  #         ->(n) { n.zero? ? 1 : n * f.(n-1) }.(n)
  #       }.(g.(g))
  #     }
  #   }
  #   ).(5)

  # Migrate the argument outside
  # ->(g) {
  #   g.(g)
  # }.(
  #   ->(g) {
  #     ->(n) {
  #       ->(f) {
  #         ->(n) { n.zero? ? 1 : n * f.(n-1) }
  #       }.(g.(g)).(n)
  #     }
  #   }
  #   ).(5)

  # Wrap everything in a function-arged wrapper
  # ->(f) {
  #   ->(g) {
  #     g.(g)
  #   }.(
  #     ->(g) {
  #       ->(n) {
  #         ->(f) {
  #           ->(n) { n.zero? ? 1 : n * f.(n-1) }
  #         }.(g.(g)).(n)
  #       }
  #     }
  #     )}.(error).(5)

  # Replace error with factorial partial
  # ->(f) {
  #   ->(g) {
  #     g.(g)
  #   }.(
  #     ->(g) {
  #       ->(n) {
  #         f.(g.(g)).(n)
  #       }
  #     }
  #     )
  # }.(
  #   ->(f) {
  #     ->(n) { n.zero? ? 1 : n * f.(n-1) }
  #   }
  #   ).(5)

  # Break into component pieces and reformat.
  # y = ->(f) {
  #   ->(g) { g.(g) }.(
  #     ->(g) { ->(n) { f.(g.(g)).(n) } } )
  # }
  #
  # fp = ->(f) {
  #   ->(n) { n.zero? ? 1 : n * f.(n-1) }
  # }
  #
  # fact = y.(fp)
  #
  # fact.(5)

  # Wrapp with integer-arged function
  # y = ->(f) {
  #   ->(g) { ->(n) { g.(g).(n) } }.(
  #     ->(g) { ->(n) { f.(g.(g)).(n) } } )
  # }
  #
  # fp = ->(f) {
  #   ->(n) { n.zero? ? 1 : n * f.(n-1) }
  # }
  #
  # fact = y.(fp)
  #
  # fact.(5)

  # Add additional partial call.
  # y = ->(f) {
  #   ->(g) { ->(n) { f.(g.(g)).(n) } }.(
  #   ->(g) { ->(n) { f.(g.(g)).(n) } } )
  # }
  #
  # fp = ->(f) {
  #   ->(n) { n.zero? ? 1 : n * f.(n-1) }
  # }
  #
  # fact = y.(fp)
  #
  # fact.(5)

  y = ->(f) {
    ->(g) { ->(n) { f.(g.(g)).(n) } }.(
    ->(g) { ->(n) { f.(g.(g)).(n) } } )
  }

  fp = ->(f) {
    ->(n) { n.zero? ? 1 : n * f.(n-1) }
  }

  fact = y.(fp)

  fact.(5)

}.()
