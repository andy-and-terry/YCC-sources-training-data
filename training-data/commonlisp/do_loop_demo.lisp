;; DO: parallel variable stepping; DO*: sequential
(do ((i 0 (1+ i))
     (acc '() (cons i acc)))
    ((= i 5) (print (nreverse acc))))

(do* ((a 1 (* a 2))
      (b a (+ b a)))
     ((> a 20) (print (list a b)))
  (format t "a=~d b=~d~%" a b))

(let ((n 0))
  (dotimes (i 10 n)
    (when (oddp i) (incf n i)))
  (print n))
(terpri)
