(defun leap-year-p (year)
  (or (and (zerop (mod year 4)) (not (zerop (mod year 100))))
      (zerop (mod year 400))))

(dolist (year '(2000 1900 2024 2023))
  (format t "~a: ~a~%" year (leap-year-p year)))
