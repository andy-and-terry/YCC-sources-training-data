(defun window-hash (s start k)
  (let ((h 0))
    (loop for i from start below (+ start k)
          do (setf h (mod (+ (* h 31) (char-code (char s i))) 1000003)))
    h))

(let ((s "abcabc"))
  (loop for i from 0 to (- (length s) 3)
        do (format t "~a ~a~%" i (window-hash s i 3))))
