;; Practical numbers: every m in 1..n is a sum of distinct divisors of n.
(defn practical? [n]
  (let [reach (reduce (fn [acc d] (if (zero? (mod n d)) (bit-or acc (bit-shift-left acc d)) acc))
                      1 (range 1 (inc n)))
        mask  (dec (bit-shift-left 1 (inc n)))]
    (= (bit-and reach mask) mask)))

(println (clojure.string/join " " (filter practical? (range 1 41))))
