;; Emirps: primes whose digit reversal is a different prime.
(defn prime? [n]
  (and (>= n 2)
       (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn rev [n]
  (Long/parseLong (apply str (reverse (str n)))))

(println (filter #(let [r (rev %)]
                    (and (not= r %) (prime? %) (prime? r)))
                 (range 2 100)))
