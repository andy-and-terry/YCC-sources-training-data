(do ((i 0 (1+ i))
     (acc '() (cons (* i i) acc)))
    ((= i 5) (format t "squares reversed: ~a~%" acc)))

(do* ((a 1 (* a 2))
      (b (+ a 1) (+ a 1)))
     ((> a 20))
  (format t "a=~a b=~a~%" a b))

(let ((n 0))
  (loop
    (incf n)
    (when (= n 3) (return-from nil (format t "stopped at ~a~%" n)))))

(dotimes (i 3 (format t "done~%"))
  (format t "iteration ~a~%" i))
