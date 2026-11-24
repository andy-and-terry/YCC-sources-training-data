;; Moebius function: 0 if n has a squared prime factor, else (-1)^k.
(defn mobius [n]
  (loop [m n p 2 acc 1]
    (cond
      (> (* p p) m) (if (> m 1) (- acc) acc)
      (zero? (mod m p)) (let [m2 (quot m p)]
                          (if (zero? (mod m2 p)) 0 (recur m2 (inc p) (- acc))))
      :else (recur m (inc p) acc))))

(println (clojure.string/join " " (map mobius (range 1 31))))
