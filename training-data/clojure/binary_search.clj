(defn binary-search [v target]
  (loop [low 0 high (dec (count v))]
    (if (> low high)
      -1
      (let [mid (quot (+ low high) 2)
            val (nth v mid)]
        (cond
          (= val target) mid
          (< val target) (recur (inc mid) high)
          :else (recur low (dec mid)))))))

(println (binary-search [1 3 5 7 9 11 13] 7))
(println (binary-search [1 3 5 7 9 11 13] 4))
