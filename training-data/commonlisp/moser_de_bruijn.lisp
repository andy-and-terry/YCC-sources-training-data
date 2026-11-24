;;; Moser-de Bruijn sequence: binary digits of n read in base 4.
(defun moser (n)
  (parse-integer (format nil "~b" n) :radix 4))

(format t "~{~a~^ ~}~%" (loop for n from 0 below 12 collect (moser n)))
