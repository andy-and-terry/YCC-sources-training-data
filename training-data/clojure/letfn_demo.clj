(defn classify [n]
  (letfn [(is-even? [x] (if (zero? x) true (is-odd? (dec x))))
          (is-odd? [x] (if (zero? x) false (is-even? (dec x))))]
    (if (is-even? n) :even :odd)))

(println (classify 7))
(println (classify 10))
