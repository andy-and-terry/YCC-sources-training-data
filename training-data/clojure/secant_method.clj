(defn secant [f a b]
  (loop [a a b b i 0]
    (let [fa (f a) fb (f b)]
      (if (or (> i 40) (zero? (- fb fa)))
        b
        (recur b (- b (/ (* fb (- b a)) (- fb fa))) (inc i))))))

(println (format "%.8f" (secant #(- (* % %) 2.0) 1.0 2.0)))
