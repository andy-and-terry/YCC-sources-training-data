;;; Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
(defun digits (n)
  (map 'list #'digit-char-p (princ-to-string n)))

(defun keith-p (n)
  (let* ((seq (reverse (digits n)))   ; newest first
         (k (length seq)))
    (loop
      (let ((last (first seq)))
        (when (>= last n) (return (= last n)))
        (push (reduce #'+ (subseq seq 0 k)) seq)))))

(format t "~{~a~^ ~}~%" (loop for n from 10 below 1200 when (keith-p n) collect n))
