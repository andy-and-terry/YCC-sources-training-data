;; Smith numbers below 100.
(defun digit-sum (n)
  (loop for m = n then (floor m 10)
        while (> m 0)
        sum (mod m 10)))

(defun prime-factors (n)
  (let ((m n) (factors '()))
    (loop for p from 2
          while (<= (* p p) m)
          do (loop while (zerop (mod m p))
                   do (push p factors)
                      (setf m (floor m p))))
    (when (> m 1) (push m factors))
    (nreverse factors)))

(defun smith-p (n)
  (let ((factors (prime-factors n)))
    (and (> (length factors) 1)
         (= (digit-sum n) (reduce #'+ (mapcar #'digit-sum factors))))))

(format t "~{~a~^ ~}~%" (loop for n from 4 below 100 when (smith-p n) collect n))
