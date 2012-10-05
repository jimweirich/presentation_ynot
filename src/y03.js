console.log ((function () {

  // Higher order functions
  // Functional Refatorings
  // * Tennent Correspondence Principle
  // * Inline function def
  // * Rescope Variable

  // GOAL: fact = FIND_FIXPOINT (fimp)

  error = function (n) { throw Error ("SHOULD NOT BE CALLED!") }

  fimp = function (fp) {
    return (function (n) {
      return n==0 ? 1 : n * fp (n-1)
    })
  }

  Y = function (f) {
    return (function (g) { return function (n) { return f (g (g)) (n) } } ) (
            function (g) { return function (n) { return f (g (g)) (n) } } ) }

  fact = Y (fimp)

  result = fact (5);

  return result;

}) ());
