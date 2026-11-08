(defun delta-encode (xs)
  (cons (first xs) (mapcar #'- (rest xs) xs)))

(defun delta-decode (ds)
  (let ((acc 0))
    (mapcar (lambda (d) (incf acc d)) ds)))

(let ((d (delta-encode '(10 12 15 15 20))))
  (print d)
  (print (delta-decode d))
  (terpri))
