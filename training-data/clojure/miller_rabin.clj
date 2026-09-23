(defn- mod-pow [base exp modulus]
  (loop [result 1 b (mod base modulus) e exp]
    (if (zero? e)
      result
      (recur (if (odd? e) (mod (* result b) modulus) result)
             (mod (* b b) modulus)
             (quot e 2)))))

(defn- witness-composite? [n d r a]
  (let [x (mod-pow a d n)]
    (if (or (= x 1) (= x (dec n)))
      false
      (loop [x x i 0]
        (cond
          (= x (dec n)) false
          (>= i (dec r)) true
          :else (recur (mod-pow x 2 n) (inc i)))))))

;; Probabilistic (deterministic here, thanks to this fixed witness set)
;; Miller-Rabin primality test.
(defn prime? [n]
  (cond
    (< n 2) false
    (some #(= n %) [2 3 5 7]) true
    (some #(zero? (mod n %)) [2 3 5 7]) false
    :else
    (let [[d r] (loop [d (dec n) r 0]
                  (if (even? d) (recur (quot d 2) (inc r)) [d r]))]
      (not-any? #(witness-composite? n d r %) [2 3 5 7 11 13 17 19 23 29 31 37]))))

(doseq [n [2 17 561 997 1000003 1000000007]]
  (println n (prime? n)))
