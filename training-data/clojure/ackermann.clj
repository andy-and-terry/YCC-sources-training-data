(defn ackermann [m n]
  (cond
    (zero? m) (inc n)
    (zero? n) (ackermann (dec m) 1)
    :else (ackermann (dec m) (ackermann m (dec n)))))

(doseq [m (range 3) n (range 4)]
  (println (str "A(" m "," n ") = " (ackermann m n))))
