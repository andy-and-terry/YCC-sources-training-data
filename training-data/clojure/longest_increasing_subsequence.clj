(defn lis [nums]
  (let [n (count nums)
        dp (atom (vec (repeat n 1)))]
    (doseq [i (range n)
            j (range i)]
      (when (< (nums j) (nums i))
        (swap! dp assoc i (max (@dp i) (inc (@dp j))))))
    (apply max @dp)))

(println (lis [10 9 2 5 3 7 101 18]))
