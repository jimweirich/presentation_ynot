(println
  (do

    ;; Higher Order Functions
    ;; Functional Refactorings
    ;; (1) Tennent Correspondence Principle
    ;; (2) Introduce Binding
    ;; (3) Rebind 
    ;; (4) Function Wrapping
    ;; (5) Inline Function
    
    (def error (fn [n] (throw (Throwable. "SHOULD NOT BE CALLED"))))

    (def fact_improver 
      (fn [partial] (fn [n] (if (zero? n) 1 (* n (partial (dec n))))) ))

    (def y 
      (fn [f] 
        ((fn [g] (fn [n] ((f (g g)) n)))
         (fn [g] (fn [n] ((f (g g)) n))))))

    (def fact (y fact_improver))


    (fact 5) 

))
