(defn equilibrium-index [nums]
  (let [total (reduce + nums)]
    (loop [i 0, left 0, xs nums]
      (cond
        (empty? xs) -1
        (= left (- total left (first xs))) i
        :else (recur (inc i) (+ left (first xs)) (rest xs))))))

(println (equilibrium-index [1 7 3 6 5 6])) ; 3
