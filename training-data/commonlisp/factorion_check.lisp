(defun fact (k) (if (< k 2) 1 (* k (fact (1- k)))))

(defun factorion-p (n)
  (= n (loop for c across (write-to-string n) sum (fact (digit-char-p c)))))

(format t "~{~a ~}~%" (loop for n from 1 below 50000 when (factorion-p n) collect n))
