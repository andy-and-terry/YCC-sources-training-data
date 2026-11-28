(defn duval [s]
  (let [n (count s)]
    (loop [i 0 out []]
      (if (>= i n)
        out
        (let [[j k] (loop [j (inc i) k i]
                      (if (and (< j n) (<= (compare (get s k) (get s j)) 0))
                        (recur (inc j) (if (neg? (compare (get s k) (get s j))) i (inc k)))
                        [j k]))
              len (- j k)
              cnt (inc (quot (- k i) len))]
          (recur (+ i (* cnt len)) (into out (repeat cnt (subs s i (+ i len))))))))))

(println (duval "banana"))
