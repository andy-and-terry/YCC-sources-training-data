;;; Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
(defun tribonacci (count)
  (let ((a 0) (b 0) (c 1) (result '()))
    (dotimes (i count (nreverse result))
      (push a result)
      (psetf a b
             b c
             c (+ a b c)))))

(format t "Tribonacci: ~{~a~^, ~}~%" (tribonacci 15))
