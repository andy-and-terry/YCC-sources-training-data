(defn pronic? [x]
  (let [n (long (Math/sqrt x))]
    (= x (* n (inc n)))))

(println (map #(* % (inc %)) (range 10))) ; (0 2 6 12 20 30 42 56 72 90)
(println (pronic? 56) (pronic? 57))       ; true false
