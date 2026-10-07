(defn catalan [n]
  (let [c (long-array (inc n))]
    (aset c 0 1)
    (doseq [i (range 1 (inc n))]
      (aset c i
        (reduce + (for [j (range i)] (* (aget c j) (aget c (- i 1 j)))))))
    (vec c)))

(println (catalan 10))
