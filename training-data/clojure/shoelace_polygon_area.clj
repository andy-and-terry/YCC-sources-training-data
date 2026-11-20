;; Shoelace polygon area.
(defn area [pts]
  (let [nxt (concat (rest pts) [(first pts)])]
    (/ (Math/abs (double (reduce + (map (fn [[x1 y1] [x2 y2]] (- (* x1 y2) (* x2 y1))) pts nxt)))) 2)))
(println (area [[0 0] [4 0] [4 3] [0 3]]))
