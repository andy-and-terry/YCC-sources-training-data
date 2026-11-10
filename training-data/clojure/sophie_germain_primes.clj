(defn prime? [n]
  (and (>= n 2) (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(def sophie-germain (filter #(and (prime? %) (prime? (inc (* 2 %)))) (iterate inc 2)))

(println (take 10 sophie-germain)) ; (2 3 5 11 23 29 41 53 83 89)
