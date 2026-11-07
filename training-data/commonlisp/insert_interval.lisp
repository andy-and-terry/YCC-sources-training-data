(defun insert-interval (ivs new)
  (let ((lo (first new)) (hi (second new)) (before '()) (after '()))
    (dolist (iv ivs)
      (cond ((< (second iv) lo) (push iv before))
            ((> (first iv) hi) (push iv after))
            (t (setf lo (min lo (first iv)) hi (max hi (second iv))))))
    (append (nreverse before) (list (list lo hi)) (nreverse after))))

(print (insert-interval '((1 3) (6 9)) '(2 5))) ; ((1 5) (6 9))
