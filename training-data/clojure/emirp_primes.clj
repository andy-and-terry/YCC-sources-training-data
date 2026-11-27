(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn rev [n] (Long/parseLong (apply str (reverse (str n)))))

(println (filter #(and (prime? %) (not= % (rev %)) (prime? (rev %))) (range 2 100)))
