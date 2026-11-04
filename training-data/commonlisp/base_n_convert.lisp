(dolist (b '(2 8 16 36))
  (format t "255 in base ~a = ~a~%" b (string-downcase (write-to-string 255 :base b :radix nil))))

(format t "~a~%" (parse-integer "zz" :radix 36))
(format t "~a~%" (parse-integer "9" :radix 8 :junk-allowed t))
