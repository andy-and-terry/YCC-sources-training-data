;; Mutual recursion would overflow the stack for large n; trampoline avoids it
;; by returning thunks instead of calling directly.
(declare my-odd?)

(defn my-even? [n]
  (if (zero? n)
    true
    #(my-odd? (dec n))))

(defn my-odd? [n]
  (if (zero? n)
    false
    #(my-even? (dec n))))

(println (trampoline my-even? 10))
(println (trampoline my-odd? 7))
(println (trampoline my-even? 1000000))

;; self-recursive countdown that records the steps
(defn countdown [n acc]
  (if (zero? n)
    (conj acc :liftoff)
    #(countdown (dec n) (conj acc n))))

(println (trampoline countdown 5 []))
