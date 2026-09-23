(defn shell-sort [coll]
  (let [n (count coll)]
    (loop [gap (quot n 2) arr (vec coll)]
      (if (zero? gap)
        arr
        (recur (quot gap 2)
               (reduce
                (fn [arr i]
                  (let [temp (nth arr i)]
                    (loop [arr arr j i]
                      (if (and (>= j gap) (> (nth arr (- j gap)) temp))
                        (recur (assoc arr j (nth arr (- j gap))) (- j gap))
                        (assoc arr j temp)))))
                arr
                (range gap n)))))))

(println (shell-sort [9 5 1 4 3 7 2 8 6]))
(println (shell-sort [12 34 54 2 3]))
