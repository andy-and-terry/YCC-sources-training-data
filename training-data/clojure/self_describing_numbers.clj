(defn self-describing? [n]
  (let [ds (mapv #(Character/digit % 10) (str n))]
    (every? (fn [i] (= (ds i) (count (filter #{i} ds))))
            (range (count ds)))))

(doseq [n [1210 2020 21200 1211]]
  (println n (self-describing? n)))
