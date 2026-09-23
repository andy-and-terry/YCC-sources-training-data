(defun render-report (items)
  (with-output-to-string (out)
    (format out "Report:~%")
    (dolist (item items)
      (format out "  - ~a~%" item))))

(print (render-report '("alpha" "beta" "gamma")))

(with-input-from-string (in "10 20 30")
  (loop for n = (read in nil nil)
        while n
        do (format t "read number: ~a~%" n)))
