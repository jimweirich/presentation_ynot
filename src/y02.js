console.log(( function () {

  // Fix Point of a Function
  // Higher Order Functions
  // Function Refactorings
  // * Tennent Correspondence Principle (w/param)
  // * Inline Function Definition

  error = function (n) { throw Error ("SHOULD NOT BE CALLED") }

  fimp = function (fp) {
    return function (n) {
      return n==0 ? 1 : n * fp (n-1)
    }
  }

  y = function (f) {
    return (function (g) { return function (n) { return f (g (g)) (n) }} ) (
            function (g) { return function (n) { return f (g (g)) (n) }} ) }

  fact = y(fimp);

  result = fact (5)

  return result;

}) ())
