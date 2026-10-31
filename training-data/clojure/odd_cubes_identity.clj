(defn cube-from-odds [n]
  (let [start (+ (- (* n n) n) 1)]
    (reduce + (map #(+ start (* 2 %)) (range n)))))

(doseq [n (range 1 6)]
  (println n (cube-from-odds n) (= (cube-from-odds n) (* n n n))))
