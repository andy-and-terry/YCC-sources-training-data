(defn summarize [xs]
  (->> xs
       (filter odd?)
       (map #(* % %))
       (reduce +)))

(println (summarize (range 10)))
(println (-> {:a 1} (assoc :b 2) (update :a inc)))
