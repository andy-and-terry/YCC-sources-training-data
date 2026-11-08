(defn rail-fence [s rails]
  (let [cyc (cycle (concat (range rails) (reverse (range 1 (dec rails)))))]
    (->> (map vector cyc s)
         (sort-by first)
         (map second)
         (apply str))))

(println (rail-fence "WEAREDISCOVERED" 3))
