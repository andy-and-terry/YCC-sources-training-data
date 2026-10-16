(defun join-with (sep list)
  (with-output-to-string (out)
    (loop for (item . rest) on list
          do (princ item out)
             (when rest (princ sep out)))))

(format t "~a~%" (join-with ", " '(red green blue)))

(let ((s (with-output-to-string (out)
           (format out "~d + ~d = ~d" 2 3 (+ 2 3))
           (terpri out)
           (write-string "done" out))))
  (format t "~s (~d chars)~%" s (length s)))
