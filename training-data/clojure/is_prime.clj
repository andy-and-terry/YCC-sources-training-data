(defn prime? [n]
  (and (> n 1)
       (not-any? #(zero? (mod n %))
                 (range 2 (inc (int (Math/sqrt n)))))))

(println (filter prime? (range 2 21)))
