(defun digit-sum (n)
  (loop for c across (princ-to-string n)
        sum (digit-char-p c)))

(defun digital-root (n)
  (if (< n 10)
      n
      (digital-root (digit-sum n))))

(print (digital-root 9875))
(print (digital-root 16))
(print (mapcar #'digital-root '(38 493193 999)))
(terpri)
