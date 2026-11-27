(defn secant [f x0 x1]
  (loop [n 50, x0 x0, x1 x1]
    (let [f0 (f x0), f1 (f x1)]
      (if (or (zero? n) (= f0 f1))
        x1
        (let [nxt (- x1 (/ (* f1 (- x1 x0)) (- f1 f0)))]
          (if (< (Math/abs (- nxt x1)) 1e-12)
            nxt
            (recur (dec n) x1 nxt)))))))

(println (secant (fn [x] (- (* x x) 2)) 1.0 2.0))
