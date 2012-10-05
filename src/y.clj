(println
 (do

   ;; Fixpoint

   (def error (fn [n] 'error))

   (def y
        (fn [ff]
          ((fn [g] (fn [n] ((ff (g g)) n)))
           (fn [g] (fn [n] ((ff (g g)) n))))))

   (def fact-partial
        (fn [recurse]
          (fn [n]
            (if (zero? n) 1 (* n (recurse (- n 1)))))))

   (def fact (y fact-partial))

   (fact 5)

   ))
