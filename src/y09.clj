(println
 (do

   (def error (fn [n] (throw (Throwable. "SHOULD NEVER BE CALLED"))))

   (def fact-improver
        (fn [partial]
          (fn [n]
            ((fn [n] (if (zero? n) 1 (* n (partial (- n 1))))) n))))

   (def y
        (fn [f]
          ((fn [g] (g g))
           (fn [g] (fn [n] ((f (g g)) n))))))

   (def fact (y fact-improver))

   (fact 5)

   ))
