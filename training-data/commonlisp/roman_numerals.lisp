(defparameter *values* '(1000 900 500 400 100 90 50 40 10 9 5 4 1))
(defparameter *symbols* '("M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I"))

(defun int-to-roman (num)
  (let ((n num) (result ""))
    (loop for value in *values*
          for sym in *symbols* do
      (loop while (>= n value) do
        (setf result (concatenate 'string result sym))
        (decf n value)))
    result))

(print (int-to-roman 1994))
