(defun lis-length (xs)
  (let ((tails '()))
    (dolist (x xs)
      (let ((pos (position-if (lambda (tl) (>= tl x)) tails)))
        (if pos
            (setf (nth pos tails) x)
            (setf tails (append tails (list x))))))
    (length tails)))

(print (lis-length '(10 9 2 5 3 7 101 18)))
