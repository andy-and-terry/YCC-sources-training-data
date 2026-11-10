(defun prime-p (n)
  (and (>= n 2) (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(format t "~{~a~^ ~}~%"
        (loop for p from 3 to 78
              when (and (prime-p p) (prime-p (+ p 2)))
                collect (format nil "(~d,~d)" p (+ p 2))))
;; (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
