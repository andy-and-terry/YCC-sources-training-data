(defun add-binary (a b)
  (format nil "~b" (+ (parse-integer a :radix 2) (parse-integer b :radix 2))))

(princ (add-binary "1010" "1011")) ; 10101
