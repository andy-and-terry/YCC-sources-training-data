(defn digit-square-sum [n]
  (reduce + (map #(let [d (- (int %) 48)] (* d d)) (str n))))

(defn happy? [n]
  (loop [n n seen #{}]
    (cond (= n 1) true
          (seen n) false
          :else (recur (digit-square-sum n) (conj seen n)))))

(println (take 8 (filter happy? (iterate inc 1)))) ; (1 7 10 13 19 23 28 31)
