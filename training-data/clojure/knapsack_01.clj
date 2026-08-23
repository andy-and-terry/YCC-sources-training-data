(defn knapsack [weights values capacity]
  (let [n (count weights)
        dp (make-array Long/TYPE (inc n) (inc capacity))]
    (doseq [i (range 1 (inc n))]
      (doseq [w (range (inc capacity))]
        (aset dp i w
              (if (<= (weights (dec i)) w)
                (max (aget dp (dec i) w)
                     (+ (values (dec i)) (aget dp (dec i) (- w (weights (dec i))))))
                (aget dp (dec i) w)))))
    (aget dp n capacity)))

(println (knapsack [1 3 4 5] [1 4 5 7] 7))
