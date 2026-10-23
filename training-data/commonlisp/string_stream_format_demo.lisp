(defun join-with-commas (items)
  (with-output-to-string (out)
    (loop for (item . rest) on items
          do (format out "~a" item)
             (when rest (write-string ", " out)))))

(print (join-with-commas '(1 2 3)))
(print (format nil "~{~a~^-~}" '(a b c)))
(print (format nil "~5,2f|~8d|~:d" 3.14159 42 1234567))
(print (with-input-from-string (in "10 20 30")
         (loop for x = (read in nil) while x sum x)))
