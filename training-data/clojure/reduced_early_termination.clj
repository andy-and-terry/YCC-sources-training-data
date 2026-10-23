;; `reduced` short-circuits reduce: wrapping a value stops the fold early.
(defn first-over [limit coll]
  (reduce (fn [acc x]
            (if (> x limit)
              (reduced x)
              acc))
          nil
          coll))

(println (first-over 10 [3 8 12 5 40]))
(println (first-over 100 [3 8 12 5 40]))

;; Works on infinite sequences because reduction stops when reduced is seen.
(println (reduce (fn [sum x]
                   (if (> (+ sum x) 50)
                     (reduced sum)
                     (+ sum x)))
                 0
                 (range)))

;; Transducers use the same protocol; `take-while` is built on reduced.
(println (transduce (take-while #(< % 6)) conj [] (range)))

;; reduced? tests for a wrapped value.
(println (reduced? (reduced 1)) (reduced? 1))
