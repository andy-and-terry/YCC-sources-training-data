(doseq [r (range 8)]
  (println (str (apply str (repeat (- 7 r) " "))
                (apply str (for [c (range (inc r))]
                             (if (= c (bit-and r c)) "* " "  "))))))
