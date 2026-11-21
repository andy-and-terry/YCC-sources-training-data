;; Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
(defn gcd [a b] (if (zero? b) a (recur b (mod a b))))

(defn pow-mod [b e m]
  (loop [b (mod b m) e e r 1]
    (cond (zero? e) r
          (odd? e) (recur (mod (* b b) m) (quot e 2) (mod (* r b) m))
          :else (recur (mod (* b b) m) (quot e 2) r))))

(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(defn carmichael? [n]
  (and (not (prime? n))
       (every? #(or (not= 1 (gcd % n)) (= 1 (pow-mod % (dec n) n))) (range 2 n))))

(println (clojure.string/join " " (filter carmichael? (range 3 3000 2))))
