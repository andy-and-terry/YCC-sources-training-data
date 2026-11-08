(defun rot47-char (c)
  (let ((n (char-code c)))
    (if (<= 33 n 126)
        (code-char (+ 33 (mod (+ (- n 33) 47) 94)))
        c)))

(defun rot47 (s) (map 'string #'rot47-char s))

(format t "~a~%" (rot47 "Hello, World!"))
(format t "~a~%" (rot47 (rot47 "Hello, World!")))
