(println
 (do

   ;; Fixpoints: n = f(n)
   ;; Higher Order Functions
   ;; Functional Refactorings
   ;; (1) Tennent Correspondence Principle
   ;; (2) Introduce Binding
   ;; (3) Rebind
   ;; (4) Wrap Function
   ;; (5) Inline Function

   (def error (fn [n] (throw (Throwable. "SHOULD NOT BE CALLED"))))

   (def fact-improver
        (fn [partial]
           (fn [n] (if (zero? n) 1 (* n (partial (dec n)))))))

   ;; Applicative Order Y-Combinator
   ;; AKA Z-Combinator
   (def y
        (fn [f]
          ((fn [g] (fn [n] ((f (g g)) n)))
           (fn [g] (fn [n] ((f (g g)) n))))))

   ;; Y-Combinator calculates the FIXPOINT of an improver function
   (def fact (y fact-improver))

   ;; (fact-improver fact) ===> fact
   ;; fact is the FIX POINT of fact-improver!

   (fact 5)

   (def fib-improver
        (fn [partial]
          (fn [n] (if (or (zero? n) (= 1 n))
                   1
                   (+ (partial (dec n)) (partial (- n 2)))))))

   (def fib (y fib-improver))

   (map fact (range 20))

))
