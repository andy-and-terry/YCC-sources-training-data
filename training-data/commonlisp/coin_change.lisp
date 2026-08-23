(defun coin-change (coins amount)
  (let ((dp (make-array (1+ amount) :initial-element (1+ amount))))
    (setf (aref dp 0) 0)
    (loop for a from 1 to amount do
      (dolist (c coins)
        (when (<= c a)
          (setf (aref dp a) (min (aref dp a) (1+ (aref dp (- a c))))))))
    (if (> (aref dp amount) amount) -1 (aref dp amount))))

(print (coin-change '(1 2 5) 11))
