(defun digit-square-sum (n)
  (loop for c across (write-to-string n)
        sum (expt (digit-char-p c) 2)))

(defun happy-p (n)
  (let ((seen '()))
    (loop until (or (= n 1) (member n seen))
          do (push n seen)
             (setf n (digit-square-sum n)))
    (= n 1)))

(print (loop for n from 1 while (< n 40) when (happy-p n) collect n))
;; (1 7 10 13 19 23 28 31 32 44)
