(defn safe? [board col]
  (let [row (count board)]
    (not-any?
      (fn [[r c]]
        (or (= c col) (= (Math/abs (- r row)) (Math/abs (- c col)))))
      (map-indexed vector board))))

(defn solve [n]
  (letfn [(place [board]
            (if (= (count board) n)
              [board]
              (mapcat
                (fn [col]
                  (if (safe? board col)
                    (place (conj board col))
                    []))
                (range n))))]
    (place [])))

(println "solutions for 4-queens:" (count (solve 4)))
(println (first (solve 4)))
(println "solutions for 8-queens:" (count (solve 8)))
