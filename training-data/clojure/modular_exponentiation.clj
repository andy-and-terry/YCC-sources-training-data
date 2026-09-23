;; Fast exponentiation by repeated squaring, reducing modulo m at each
;; step so intermediate values never grow beyond m^2.
(defn mod-pow [base exp modulus]
  (loop [result 1 b (mod base modulus) e exp]
    (if (zero? e)
      result
      (recur (if (odd? e) (mod (* result b) modulus) result)
             (mod (* b b) modulus)
             (quot e 2)))))

(println (mod-pow 2 10 1000))
(println (mod-pow 7 128 13))
