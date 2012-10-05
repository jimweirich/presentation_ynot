(println
 (do

   (def error (fn [x] (throw (Throwable. "SHOULD NOT BE CALLED"))))

   ;; Fixpoints
   ;; Higher Order Functions
   ;; Functional Refactorings
   ;; (1) Tennent Correspondence Principle
   ;; (2) Introduce Binding
   ;; (3) Rebind
   ;; (4) Function Wrapping
   ;; (5) Function Inlining

   (def y
        (fn [improver]
          ((fn [gen] (gen gen))
           (fn [gen] (fn [n] ((improver (gen gen)) n))))))

   (def fact-improver
        (fn [partial]
          (fn [n] (if (zero? n) 1 (* n (partial (- n 1)))))))

   (def fact (y fact-improver))

   ;; fact == (fact-improver fact)

   (fact 5)

   ))
