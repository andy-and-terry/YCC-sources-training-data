(let* ((a (list 1 2 3))
       (b (list 4 5))
       (joined (nconc a b)))
  (format t "~a ~a~%" joined a))

(let ((xs (list 5 4 3 2 1)))
  (setf xs (nreverse xs))
  (format t "~a~%" xs)
  (setf xs (delete 3 xs))
  (format t "~a~%" xs)
  (setf xs (sort xs #'>))
  (format t "~a~%" xs))

(let ((orig (list 1 2 3)))
  (let ((copy (reverse orig)))
    (format t "~a ~a~%" orig copy)))

(format t "~a~%" (append '(1) '(2) nil '(3 4)))
(format t "~a~%" (revappend '(3 2 1) '(4 5)))
