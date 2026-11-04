(defun toeplitz-p (m)
  (loop for (prev cur) on m
        while cur
        always (equal (cdr cur) (subseq prev 0 (1- (length cur))))))

(format t "~a~%" (toeplitz-p '((1 2 3) (4 1 2) (5 4 1))))
(format t "~a~%" (toeplitz-p '((1 2) (2 2))))
