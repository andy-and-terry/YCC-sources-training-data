(defun reverse-bits (v &optional (width 8))
  (let ((r 0))
    (dotimes (i width r)
      (setf r (logior (ash r 1) (logand (ash v (- i)) 1))))))

(dolist (v '(1 6 13 128))
  (format t "~d ~d~%" v (reverse-bits v))) ; 128 96 176 1
