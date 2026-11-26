;; Primorials up to 1e6, including 1; expect 8.
(defun primep (n)
  (and (> n 1)
       (loop for d from 2 while (<= (* d d) n) never (zerop (mod n d)))))

(print (let ((acc 1) (out (list 1)))
         (loop for p from 2
               when (primep p)
                 do (setf acc (* acc p))
                    (when (> acc 1000000) (return (reverse out)))
                    (push acc out))))
