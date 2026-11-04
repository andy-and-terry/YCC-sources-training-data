(defn zigzag [s rows]
  (if (or (= rows 1) (>= rows (count s)))
    s
    (let [cycle-rows (concat (range rows) (range (- rows 2) 0 -1))]
      (->> (map vector (cycle cycle-rows) s)
           (sort-by first)
           (map second)
           (apply str)))))

(println (zigzag "PAYPALISHIRING" 3))
