(println
 (do

   ;; Higher Order Functions
   ;; Refactorings
   ;; (1) Inlining
   ;; (2) Function Wrapping
   ;; Fixpoint

   (def error (fn [n] (throw (Throwable. "SHOULD NOT CALL"))))

   (def fact-partial
        (fn [recursive]
          (fn [n] (if (zero? n) 1 (* n (recursive (- n 1)))))))

   ;; Applicative Order Y-Combinator

   (def y
        (fn [f]
          ((fn [fp] (fn [n] ((f (fp fp)) n)))
           (fn [fp] (fn [n] ((f (fp fp)) n))))))

   (def fact (y fact-partial))

   (fact 5)

))
