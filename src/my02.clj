(println
 (do

   ;; Fixpoint: (cos (cos (cos 0)))
   ;; Higher Order Functions
   ;; Refactorings

   (def error (fn [n] (throw (Throwable. "SHOULD NOT CALL"))))

   (def fp
        (fn [recurse]
          (fn [n]
            (if (zero? n) 1 (* n (recurse (- n 1)))))))

   (def y
        (fn [fun]
          ((fn [g] (fn [n] ((fun (g g)) n)))
           (fn [g] (fn [n] ((fun (g g)) n))))))

   (def fact (y fp))

   (fact 5)

   ))
