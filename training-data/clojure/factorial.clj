(defn factorial [n]
  (reduce *' 1 (range 1 (inc n))))

(doseq [n (range 11)]
  (println (factorial n)))
