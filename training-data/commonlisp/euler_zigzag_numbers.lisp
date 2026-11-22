;;; Euler zigzag numbers via the Seidel-Entringer boustrophedon.
(defun step (row)
  (let ((acc (list 0)))
    (dolist (x (reverse row))
      (push (+ (first acc) x) acc))
    (nreverse acc)))

(format t "~{~a~^ ~}~%"
        (loop repeat 10
              for row = (list 1) then (step row)
              collect (car (last row))))
