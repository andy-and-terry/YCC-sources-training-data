(def ^:dynamic *tax-rate* 0.07)

(defn price-with-tax [amount]
  (* amount (+ 1 *tax-rate*)))

(println "default rate:" (price-with-tax 100))

(binding [*tax-rate* 0.15]
  (println "rebound in scope:" (price-with-tax 100))
  (binding [*tax-rate* 0.0]
    (println "nested rebind:" (price-with-tax 100)))
  (println "back to outer binding:" (price-with-tax 100)))

(println "restored after binding block:" (price-with-tax 100))
