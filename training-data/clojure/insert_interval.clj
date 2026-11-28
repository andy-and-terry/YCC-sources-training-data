(defn insert-interval [intervals [nlo nhi]]
  (let [[before rest*] (split-with (fn [[_ hi]] (< hi nlo)) intervals)
        [overlap after] (split-with (fn [[lo _]] (<= lo nhi)) rest*)
        merged [(apply min nlo (map first overlap))
                (apply max nhi (map second overlap))]]
    (concat before [merged] after)))

(println (insert-interval [[1 3] [6 9]] [2 5])) ; ([1 5] [6 9])
