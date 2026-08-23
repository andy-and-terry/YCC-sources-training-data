(defn leap-year? [year]
  (or (and (zero? (mod year 4)) (not (zero? (mod year 100))))
      (zero? (mod year 400))))

(doseq [year [2000 1900 2024 2023]]
  (println year (leap-year? year)))
