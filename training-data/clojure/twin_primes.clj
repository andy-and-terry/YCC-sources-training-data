(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(println (->> (filter prime? (range 2 51))
              (partition 2 1)
              (filter (fn [[a b]] (= 2 (- b a))))))
