(defun max-subarray (nums)
  (let ((max-so-far (car nums)) (max-ending-here (car nums)))
    (dolist (x (cdr nums))
      (setf max-ending-here (max x (+ max-ending-here x)))
      (setf max-so-far (max max-so-far max-ending-here)))
    max-so-far))

(print (max-subarray '(-2 1 -3 4 -1 2 1 -5 4)))
