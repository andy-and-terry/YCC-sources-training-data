(defun zip (&rest lists)
  (apply #'mapcar #'list lists))

(defun unzip (pairs)
  (apply #'mapcar #'list pairs))

(let ((z (zip '(1 2 3) '(a b c) '("x" "y" "z"))))
  (print z)
  (print (unzip z)))

(print (pairlis '(:a :b :c) '(1 2 3)))
(print (mapcar #'cons '(1 2 3) '(a b c)))
(terpri)
