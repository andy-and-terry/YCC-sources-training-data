(defn two-sum [nums target]
  (loop [i 0 seen {}]
    (if (>= i (count nums))
      nil
      (let [n (nth nums i)
            complement (- target n)]
        (if (contains? seen complement)
          [(seen complement) i]
          (recur (inc i) (assoc seen n i)))))))

(println (two-sum [2 7 11 15] 9))
