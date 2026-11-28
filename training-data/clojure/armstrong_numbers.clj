(defn armstrong? [n]
  (let [ds (map #(- (int %) 48) (str n))
        len (count ds)]
    (= n (reduce + (map #(long (Math/pow % len)) ds)))))

(println (filter armstrong? (range 1 1000))) ; (1 2 ... 9 153 370 371 407)
