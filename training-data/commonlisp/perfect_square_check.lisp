(defun perfect-square-p (n)
  (and (>= n 0)
       (let ((r (isqrt n)))
         (= (* r r) n))))

(format t "~a~%" (loop for n from 0 below 30 when (perfect-square-p n) collect n))
