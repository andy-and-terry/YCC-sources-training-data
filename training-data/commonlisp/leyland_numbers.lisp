;;; Leyland numbers: x^y + y^x for x >= y >= 2.
(defun leyland (x y) (+ (expt x y) (expt y x)))

(format t "~{~a~^ ~}~%"
        (loop for x from 2 to 4
              append (loop for y from 2 to x collect (leyland x y))))
