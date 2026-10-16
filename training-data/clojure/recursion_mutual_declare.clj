(declare my-odd?)

(defn my-even? [n]
  (if (zero? n) true (my-odd? (dec n))))

(defn my-odd? [n]
  (if (zero? n) false (my-even? (dec n))))

(println (my-even? 10) (my-odd? 7) (my-even? 7))
