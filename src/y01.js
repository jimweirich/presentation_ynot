console.log((function () {

  error = function (n) { throw Error ("SHOULD NEVER CALL")};

  fp = function (fp) {
      return  function (n) {
        return  n==0 ? 1 : n * fp (n-1)
      };
    }

  y = function (f) {
    return ((function (g) { return function (n) { return f (g (g)) (n);}}) (
             function (g) { return function (n) { return f (g (g)) (n);}}));
  };

  fact = y (fp);

  result = fact (5);

  return result;
})())
