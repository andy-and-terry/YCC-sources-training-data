(defn prime? [n]
  (and (>= n 2) (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(println (for [p (range 3 79) :when (and (prime? p) (prime? (+ p 2)))] [p (+ p 2)]))
; ([3 5] [5 7] [11 13] [17 19] [29 31] [41 43] [59 61] [71 73])
