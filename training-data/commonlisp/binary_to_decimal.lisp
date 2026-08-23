(defun binary-to-decimal (bin-str)
  (parse-integer bin-str :radix 2))

(print (binary-to-decimal "1010"))
(print (binary-to-decimal "11111111"))
