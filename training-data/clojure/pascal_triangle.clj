(defn next-row [row]
  (vec (concat [1] (map + row (rest row)) [1])))

(defn pascal [n]
  (take n (iterate next-row [1])))

(doseq [row (pascal 6)]
  (println (clojure.string/join " " row)))
