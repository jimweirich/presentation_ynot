(println

 (((fn [fun]
     ((fn [g] (fn [n] ((fun (g g)) n)))
      (fn [g] (fn [n] ((fun (g g)) n)))))
   (fn [recurse]
     (fn [n] (if (zero? n) 1 (* n (recurse (- n 1))))))) 5)

 )
