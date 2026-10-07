(defn next-row [row]
  (mapv +' (concat [0] row) (concat row [0])))

(defn pascals-triangle [rows]
  (take rows (iterate next-row [1])))

(doseq [row (pascals-triangle 6)]
  (println row))
