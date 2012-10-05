(println
 (do

   (def error (fn [n] (throw (Throwable. "SHOULD NOT CALL"))))

   (def fp
        (fn [recursive]
          (fn [n] (if (zero? n) 1 (* n (recursive (- n 1)))))))

   (def f0 (fp error))
   (def f1 (fp f0))
   (def f2 (fp f1))

   (f1 1)

   ))
