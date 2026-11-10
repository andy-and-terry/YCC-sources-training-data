;; D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1), memoised.
(def delannoy
  (memoize (fn [m n]
             (if (or (zero? m) (zero? n))
               1
               (+ (delannoy (dec m) n) (delannoy m (dec n)) (delannoy (dec m) (dec n)))))))

(println (map #(delannoy % %) (range 6))) ; (1 3 13 63 321 1683)
