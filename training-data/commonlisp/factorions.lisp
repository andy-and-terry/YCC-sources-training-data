(defun fact (n) (if (<= n 1) 1 (* n (fact (1- n)))))

(defun factorion-p (n)
  (= n (loop for c across (write-to-string n) sum (fact (digit-char-p c)))))

(print (loop for n from 1 below 50000 when (factorion-p n) collect n))
;; (1 2 145 40585)
