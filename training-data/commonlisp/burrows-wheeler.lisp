(defun bwt (s)
  (let* ((n (length s))
         (rots (loop for i below n
                     collect (concatenate 'string (subseq s i) (subseq s 0 i)))))
    (map 'string (lambda (r) (char r (1- n)))
         (sort rots #'string<))))

(format t "~a~%" (bwt "banana$"))
