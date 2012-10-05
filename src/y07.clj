(println
 (do

   (def error (fn [n] (throw (Throwable. "SHOULD NOT CALL"))))

   (((fn [rec]
        (fn [n] (if (zero? n) 1N (* n (rec (- n 1))))))
      error)

    1)


   ))
