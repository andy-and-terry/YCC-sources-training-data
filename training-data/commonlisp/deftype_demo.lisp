(deftype small-int () '(integer -100 100))
(deftype non-empty-string () '(and string (satisfies plusp-length)))
(defun plusp-length (s) (plusp (length s)))
(deftype percent () '(integer 0 100))

(defun clamp-percent (n)
  (check-type n real)
  (the percent (max 0 (min 100 (round n)))))

(format t "~a ~a~%" (typep 50 'small-int) (typep 500 'small-int))
(format t "~a ~a~%" (typep "" 'non-empty-string) (typep "x" 'non-empty-string))
(format t "~a ~a~%" (clamp-percent 140.7) (clamp-percent -3))
