(println
 (do

   (def error (fn [n] (throw (Throwable. "SHOULD NOT BE CALLED"))))

   (def fact-improver
        (fn [partial]
          (fn [n] (if (zero? n) 1 (* n (partial (- n 1)))))))

   ;; Applicative Order Y Combinator
   (def y
        (fn [f]
          ((fn [g] (fn [n] ((f (g g)) n)))
           (fn [g] (fn [n] ((f (g g)) n))))))

   (def fact (y fact-improver))

   (fact 5)

   ))
