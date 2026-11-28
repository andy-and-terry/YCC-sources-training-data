(defn minimum-total [triangle]
  (first
   (reduce (fn [below row]
             (map-indexed (fn [i v] (+ v (min (nth below i) (nth below (inc i))))) row))
           (last triangle)
           (reverse (butlast triangle)))))

(println (minimum-total [[2] [3 4] [6 5 7] [4 1 8 3]])) ; 11
