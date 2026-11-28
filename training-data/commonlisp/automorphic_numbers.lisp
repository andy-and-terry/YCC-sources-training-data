(defun automorphic-p (n)
  (let* ((sq (write-to-string (* n n)))
         (s (write-to-string n))
         (start (- (length sq) (length s))))
    (and (>= start 0) (string= (subseq sq start) s))))

(print (loop for n from 0 below 1000 when (automorphic-p n) collect n))
;; (0 1 5 6 25 76 376 625)
