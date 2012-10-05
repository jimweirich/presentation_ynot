(println
 (do

   (def error (fn [n] (throw (Throwable. "SHOULD NEVER BE CALLED"))))

   (def fact-partial
        (fn [recursive]
          (fn [n] (if (zero? n) 1 (* n (recursive (- n 1)))))))

   (def y
        (fn [prf]
          ((fn [g] (fn [n] ((prf (g g)) n)))
           (fn [g] (fn [n] ((prf (g g)) n))))))

   (def fact
        (y fact-partial))

   (fact  5)

   ))
