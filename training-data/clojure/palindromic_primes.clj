(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn palindrome? [n]
  (let [s (str n)] (= s (apply str (reverse s)))))

(println (filter #(and (palindrome? %) (prime? %)) (range 2 200)))
; (2 3 5 7 11 101 131 151 181 191)
