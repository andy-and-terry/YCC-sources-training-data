(defun fact (n) (if (< n 2) 1 (* n (fact (1- n)))))
(defun comb (n k) (/ (fact n) (* (fact k) (fact (- n k)))))
(defun lah (n k) (/ (* (comb (1- n) (1- k)) (fact n)) (fact k)))

(loop for n from 1 to 5
      do (format t "~{~a~^ ~}~%" (loop for k from 1 to n collect (lah n k))))
