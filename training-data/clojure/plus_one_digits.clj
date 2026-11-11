(defn plus-one [digits]
  (let [[carry result]
        (reduce (fn [[c acc] d]
                  (let [s (+ d c)] [(quot s 10) (cons (rem s 10) acc)]))
                [1 '()]
                (reverse digits))]
    (vec (if (pos? carry) (cons carry result) result))))

(println (plus-one [1 2 9])) ; [1 3 0]
(println (plus-one [9 9]))   ; [1 0 0]
