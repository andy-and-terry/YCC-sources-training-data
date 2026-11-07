(defun max-area (heights)
  (let* ((h (coerce heights 'vector)) (lo 0) (hi (1- (length h))) (best 0))
    (loop while (< lo hi)
          do (setf best (max best (* (min (aref h lo) (aref h hi)) (- hi lo))))
             (if (< (aref h lo) (aref h hi)) (incf lo) (decf hi)))
    best))

(print (max-area '(1 8 6 2 5 4 8 3 7))) ; 49
