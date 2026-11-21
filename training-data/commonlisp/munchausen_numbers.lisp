;;; Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
(defun munchausen-p (n)
  (= n (loop for c across (princ-to-string n)
             for d = (digit-char-p c)
             sum (if (zerop d) 0 (expt d d)))))

(format t "~{~a~^ ~}~%" (loop for n from 1 below 5000 when (munchausen-p n) collect n))
