(defn mod-pow [base exponent modulus]
  (loop [result 1 b (mod base modulus) e exponent]
    (if (zero? e)
      result
      (recur
        (if (odd? e) (mod (* result b) modulus) result)
        (mod (* b b) modulus)
        (quot e 2)))))

(println (mod-pow 2 10 1000))
(println (mod-pow 7 128 13))
