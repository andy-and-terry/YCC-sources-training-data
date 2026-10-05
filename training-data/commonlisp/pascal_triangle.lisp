(defun next-row (row)
  (mapcar #'+ (cons 0 row) (append row '(0))))

(defun pascal (n)
  (loop repeat n
        for row = '(1) then (next-row row)
        collect row))

(dolist (row (pascal 6))
  (format t "~{~a~^ ~}~%" row))
