(defun armstrong-p (n)
  (let* ((s (write-to-string n))
         (len (length s)))
    (= n (loop for c across s sum (expt (digit-char-p c) len)))))

(print (loop for n from 1 below 1000 when (armstrong-p n) collect n))
;; (1 2 3 4 5 6 7 8 9 153 370 371 407)
