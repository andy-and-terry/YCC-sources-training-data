(defstruct point x y)

(defun scale-point (p factor)
  (symbol-macrolet ((px (point-x p))
                     (py (point-y p)))
    (setf px (* px factor))
    (setf py (* py factor))))

(let ((p (make-point :x 2 :y 3)))
  (scale-point p 10)
  (print p))

(defun with-local-total (numbers)
  (let ((total 0))
    (symbol-macrolet ((running-total total))
      (dolist (n numbers)
        (incf running-total n))
      running-total)))

(print (with-local-total '(1 2 3 4 5)))
