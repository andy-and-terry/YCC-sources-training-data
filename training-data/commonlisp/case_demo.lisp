(defun day-name (n)
  (case n
    (1 "Monday")
    (2 "Tuesday")
    (3 "Wednesday")
    (4 "Thursday")
    (5 "Friday")
    ((6 7) "Weekend")
    (otherwise "Unknown")))

(dotimes (n 8)
  (format t "~a -> ~a~%" n (day-name n)))
