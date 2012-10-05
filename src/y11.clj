(println
 (do

   ;; 1) Tennent Correspondence Principle
   ;; 2) Introduce Binding
   ;; 3) Rebind
   ;; 4) Wrap Function
   ;; 5) Inline Function

   (def error (fn [n] (throw (Throwable. "SHOULD NOT BE CALLED"))))

   (def fact-improver
        (fn [partial]
          (fn [n]
            (if (zero? n) 1 (* n (partial (- n 1)))))))

   ;; Applicative Order Y Combinator
   ;; Calculates the Fixpoint of an improver function

   (def y
        (fn [f]
          ((fn [g] (fn [n] ((f (g g)) n)))
           (fn [g] (fn [n] ((f (g g)) n))))))

   (def fact (y fact-improver))

   (fact 5)

   ))
