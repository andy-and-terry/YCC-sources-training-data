(defn edit-distance [a b]
  (let [n (count a)
        m (count b)
        dp (atom (vec (repeat (inc n) (vec (repeat (inc m) 0)))))]
    (dotimes [i (inc n)]
      (swap! dp assoc-in [i 0] i))
    (dotimes [j (inc m)]
      (swap! dp assoc-in [0 j] j))
    (dotimes [i n]
      (dotimes [j m]
        (let [i1 (inc i)
              j1 (inc j)]
          (if (= (nth a i) (nth b j))
            (swap! dp assoc-in [i1 j1] (get-in @dp [i j]))
            (swap! dp assoc-in [i1 j1]
                   (inc (min (get-in @dp [i j1])
                             (get-in @dp [i1 j])
                             (get-in @dp [i j]))))))))
    (get-in @dp [n m])))

(println (edit-distance "kitten" "sitting"))
(println (edit-distance "flaw" "lawn"))
