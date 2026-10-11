(defun report (n)
  (format t "~d file~:p found~%" n))

(report 0)
(report 1)
(report 5)

(dolist (n '(0 1 2))
  (format t "~[zero~;one~;two~:;lots~]~%" n))

(dolist (flag '(nil t))
  (format t "~:[off~;on~]~%" flag))

(format t "~r ~:r ~@r~%" 21 21 21)
(format t "~(~a~) ~@(~a~)~%" "LOWER ME" "capitalise me")
