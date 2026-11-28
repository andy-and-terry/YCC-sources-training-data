(defn encode [text rails]
  (let [period (* 2 (dec rails))
        rail (fn [i] (let [m (mod i period)] (if (< m rails) m (- period m))))]
    (->> (map-indexed (fn [i c] [(rail i) i c]) text)
         (sort-by (juxt first second))
         (map #(nth % 2))
         (apply str))))

(println (encode "WEAREDISCOVERED" 3))
