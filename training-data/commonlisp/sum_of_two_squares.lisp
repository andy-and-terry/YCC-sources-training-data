;;; Positive n expressible as a*a + b*b with a, b >= 0.
(defun representable-p (n)
  (loop for a from 0 to (isqrt n)
        thereis (let ((b (isqrt (- n (* a a)))))
                  (= n (+ (* a a) (* b b))))))

(format t "~{~a~^ ~}~%" (loop for n from 1 to 30 when (representable-p n) collect n))
