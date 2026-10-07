;; Mutual recursion without growing the stack: return thunks and trampoline them.
(declare my-odd?)

(defn my-even? [n]
  (if (zero? n) true #(my-odd? (dec n))))

(defn my-odd? [n]
  (if (zero? n) false #(my-even? (dec n))))

(println (trampoline my-even? 1000000))
(println (trampoline my-odd? 7))
