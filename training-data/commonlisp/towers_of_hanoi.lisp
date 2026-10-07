(defvar *moves* 0)

(defun hanoi (n from to via)
  (when (plusp n)
    (hanoi (1- n) from via to)
    (incf *moves*)
    (format t "Move disk ~d from ~a to ~a~%" n from to)
    (hanoi (1- n) via to from)))

(hanoi 3 'a 'c 'b)
(format t "Total moves: ~d~%" *moves*)
