(defun self-describing-p (n)
  (let ((s (write-to-string n)))
    (loop for i from 0 below (length s)
          always (= (count (digit-char i) s)
                    (digit-char-p (char s i))))))

(dolist (n '(1210 2020 21200 1211))
  (format t "~a ~a~%" n (self-describing-p n)))
