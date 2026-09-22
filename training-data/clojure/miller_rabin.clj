(defn power-mod [base exp m]
  (loop [b (mod base m) e exp result 1]
    (if (zero? e)
      result
      (if (odd? e)
        (recur (mod (* b b) m) (bit-shift-right e 1) (mod (* result b) m))
        (recur (mod (* b b) m) (bit-shift-right e 1) result)))))

(defn miller-rabin-witness? [a d n r]
  (loop [x (power-mod a d n) i 0]
    (cond
      (or (= x 1) (= x (dec n))) false
      (= i (dec r)) true
      :else (recur (mod (* x x) n) (inc i)))))

(defn prime? [n]
  (cond
    (< n 2) false
    (some #(= n %) [2 3 5 7 11 13]) true
    (some #(zero? (mod n %)) [2 3 5 7 11 13]) false
    :else
    (let [[d r] (loop [d (dec n) r 0]
                  (if (even? d)
                    (recur (quot d 2) (inc r))
                    [d r]))]
      (not (some #(miller-rabin-witness? % d n r) [2 3 5 7 11 13 17 19 23 29 31 37])))))

(println (prime? 97))
(println (prime? 561))
(println (prime? 1000000007))
(println (prime? 91))
