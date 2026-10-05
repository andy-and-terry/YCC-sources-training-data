;; Mutual recursion without stack growth using trampoline.
(declare my-odd?)

(defn my-even? [n]
  (if (zero? n) true #(my-odd? (dec n))))

(defn my-odd? [n]
  (if (zero? n) false #(my-even? (dec n))))

(println (trampoline my-even? 10))
(println (trampoline my-odd? 100001))
(println (trampoline my-even? 1000000))
