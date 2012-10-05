(println
 (do
   ;; Fixpoints
   ;; Higher Order Functions
   ;; Functional Refactorings
   ;; (1) Tennent Correspondence Principle
   ;; (2) Introduce Binding
   ;; (3) Wrap Function
   ;; (4) Inline Definition
   ;; Recursion

   (def error (fn [n] (throw (Throwable. "SHOULD NOT BE CALLED"))))

   (def fact-improver
        (fn [partial]
          (fn [n] (if (zero? n) 1 (* n (partial (dec n)))))))

   ;; Fixpoint combinator
   ;; Applicative Order Y-Combinator (Z-Combinator)
   (def y
        (fn [f]
          ((fn [x] (f (fn [v] ((x x) v))))
           (fn [x] (f (fn [v] ((x x) v)))))))

   ;; Y calculates the fixpoint of an improver
   (def fact (y fact-improver))

   ;; Fact is the fixpoint of the fact-improver function
   (def fact (fact-improver fact))

   (fact 5)

))