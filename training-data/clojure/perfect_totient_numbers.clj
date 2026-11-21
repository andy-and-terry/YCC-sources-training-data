;; Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
(defn gcd [a b] (if (zero? b) a (recur b (mod a b))))

(defn phi [n] (count (filter #(= 1 (gcd % n)) (range 1 (inc n)))))

(defn chain-sum [m]
  (loop [m m total 0]
    (if (<= m 1) total (let [p (phi m)] (recur p (+ total p))))))

(println (clojure.string/join " " (filter #(= % (chain-sum %)) (range 2 200))))
