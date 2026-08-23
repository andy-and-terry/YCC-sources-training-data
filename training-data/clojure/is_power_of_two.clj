(defn power-of-two? [n]
  (and (pos? n) (zero? (bit-and n (dec n)))))

(doseq [n [1 2 3 4 16 18]]
  (println n (power-of-two? n)))
