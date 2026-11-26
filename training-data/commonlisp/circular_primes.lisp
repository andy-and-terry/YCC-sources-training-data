;; Circular primes below 100; expect 13.
(defun primep (n)
  (and (> n 1)
       (loop for d from 2 while (<= (* d d) n) never (zerop (mod n d)))))

(defun circularp (n)
  (let* ((s (princ-to-string n)) (len (length s)))
    (loop for i below len
          always (primep (parse-integer (concatenate 'string (subseq s i) (subseq s 0 i)))))))
(print (loop for n from 2 below 100 count (circularp n)))
