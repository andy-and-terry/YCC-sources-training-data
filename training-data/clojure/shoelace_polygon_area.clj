(defn area [pts]
  (let [nxt (conj (vec (rest pts)) (first pts))
        s (reduce + (map (fn [[x1 y1] [x2 y2]] (- (* x1 y2) (* x2 y1))) pts nxt))]
    (/ (Math/abs (double s)) 2)))

(println (area [[0 0] [4 0] [4 3] [0 3]]))
