(defn to-base [n base]
  (if (zero? n)
    "0"
    (->> (iterate #(quot % base) n)
         (take-while pos?)
         (map #(Character/forDigit (rem % base) base))
         reverse
         (apply str))))

(doseq [b [2 8 16 36]]
  (println (str "255 in base " b " = " (to-base 255 b))))
(println (Integer/parseInt "zz" 36))
