(defun mod-pow (base exponent modulus)
  (let ((result 1) (b (mod base modulus)) (e exponent))
    (loop while (> e 0) do
      (when (oddp e)
        (setf result (mod (* result b) modulus)))
      (setf b (mod (* b b) modulus))
      (setf e (floor e 2)))
    result))

(format t "~a~%" (mod-pow 2 10 1000))
(format t "~a~%" (mod-pow 7 128 13))
