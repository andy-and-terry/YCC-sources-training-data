(defun swap-case (s)
  (map 'string
       (lambda (c) (if (upper-case-p c) (char-downcase c) (char-upcase c)))
       s))

(format t "~a~%" (swap-case "Hello World 42"))
