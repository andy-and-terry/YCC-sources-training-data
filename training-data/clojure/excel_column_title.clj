(defn column-title [n]
  (loop [n n, out '()]
    (if (zero? n)
      (apply str out)
      (let [m (dec n)]
        (recur (quot m 26) (cons (char (+ 65 (rem m 26))) out))))))

(println (column-title 28) (column-title 701)) ; AB ZY
