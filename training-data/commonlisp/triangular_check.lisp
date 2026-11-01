;;; n is triangular iff 8n + 1 is a perfect square.
(defun triangular-p (n)
  (let* ((s (+ (* 8 n) 1))
         (r (isqrt s)))
    (= (* r r) s)))

(format t "~{~a~^ ~}~%" (loop for n from 0 to 20 when (triangular-p n) collect n))
