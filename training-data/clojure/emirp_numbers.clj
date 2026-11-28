(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn rev [n] (Long/parseLong (apply str (reverse (str n)))))

(println (filter #(and (not= % (rev %)) (prime? %) (prime? (rev %))) (range 2 200)))
; (13 17 31 37 71 73 79 97 107 113 149 157 167 179 199)
