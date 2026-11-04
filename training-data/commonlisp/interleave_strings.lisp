(defun interleave (&rest strings)
  (let ((longest (reduce #'max strings :key #'length)))
    (with-output-to-string (out)
      (dotimes (i longest)
        (dolist (s strings)
          (when (< i (length s)) (write-char (char s i) out)))))))

(format t "~a~%" (interleave "abc" "12345"))
(format t "~a~%" (interleave "ab" "cd" "efg"))
