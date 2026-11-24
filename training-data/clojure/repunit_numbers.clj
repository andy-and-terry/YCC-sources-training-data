;; Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
(let [repunits (take 8 (rest (iterate #(inc (* % 10)) 0)))]
  (doseq [r repunits]
    (println (str r (when (zero? (mod r 3)) "  (divisible by 3)")))))
