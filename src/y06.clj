(println
 (do

   (def fact (fn [n] (if (zero? n) 1N (* n (fact (- n 1))))))

   (fact 50)

   ))
