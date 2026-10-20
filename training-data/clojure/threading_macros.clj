(def data [{:n 1} {:n 2} {:n 3} {:n 4}])
(->> data (map :n) (filter even?) (reduce +) println)
(-> {:a 1} (assoc :b 2) (update :a inc) println)
