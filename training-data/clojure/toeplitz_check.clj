(defn toeplitz? [m]
  (every? (fn [[prev cur]] (= (rest cur) (take (dec (count cur)) prev)))
          (partition 2 1 m)))

(println (toeplitz? [[1 2 3] [4 1 2] [5 4 1]]))
(println (toeplitz? [[1 2] [2 2]]))
