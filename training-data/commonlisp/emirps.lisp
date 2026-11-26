;; Emirps below 200; expect 15.
(defun primep (n)
  (and (> n 1)
       (loop for d from 2 while (<= (* d d) n) never (zerop (mod n d)))))

(defun rev (n) (parse-integer (reverse (princ-to-string n))))
(print (loop for n from 2 below 200 count (and (/= (rev n) n) (primep n) (primep (rev n)))))
