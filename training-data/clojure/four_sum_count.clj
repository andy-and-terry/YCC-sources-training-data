(defn four-sum-count [a b c d]
  (let [sums (frequencies (for [x a y b] (+ x y)))]
    (reduce + (for [x c y d] (get sums (- (+ x y)) 0)))))

(println (four-sum-count [1 2] [-2 -1] [-1 2] [0 2])) ; 2
