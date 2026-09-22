(defun run-length-encode (s)
  (with-output-to-string (out)
    (let ((n (length s)) (i 0))
      (loop while (< i n) do
        (let ((c (char s i)) (count 0))
          (loop while (and (< i n) (char= (char s i) c)) do
            (incf count)
            (incf i))
          (format out "~a~a" count c))))))

(format t "~a~%" (run-length-encode "aaabbbcca"))
(format t "~a~%" (run-length-encode "wwwwaaadexxxxxx"))
