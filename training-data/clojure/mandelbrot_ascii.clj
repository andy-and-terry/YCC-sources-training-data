(defn iterations [cr ci]
  (loop [zr 0.0 zi 0.0 n 0]
    (if (or (= n 30) (>= (+ (* zr zr) (* zi zi)) 4.0))
      n
      (recur (+ (- (* zr zr) (* zi zi)) cr) (+ (* 2 zr zi) ci) (inc n)))))

(doseq [y (range -1.0 1.01 0.2)]
  (println (apply str (for [x (range -2.0 0.61 0.05)]
                        (if (= 30 (iterations x y)) \# \.)))))
