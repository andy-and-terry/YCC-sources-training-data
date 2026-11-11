;; Fermat primality test; Carmichael number 561 fools it.
(defn probably-prime? [n]
  (and (> n 2)
       (= 1N (.modPow (biginteger 2) (biginteger (dec n)) (biginteger n)))))

(doseq [n [97 91 561]]
  (println n (probably-prime? n)))
