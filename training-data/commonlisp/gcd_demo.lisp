(defun my-gcd (a b)
  (if (zerop b) a (my-gcd b (mod a b))))

(print (my-gcd 48 18))
(print (my-gcd 100 75))
