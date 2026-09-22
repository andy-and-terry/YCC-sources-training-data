(defun describe-value (v)
  (typecase v
    (integer (format nil "integer: ~a" v))
    (string (format nil "string of length ~a" (length v)))
    (list (format nil "list with ~a elements" (length v)))
    (symbol (format nil "symbol named ~a" v))
    (t (format nil "unknown type: ~a" v))))

(print (describe-value 42))
(print (describe-value "hello"))
(print (describe-value '(1 2 3)))
(print (describe-value 'foo))
(print (describe-value 3.14))

(defun safe-describe (v)
  (etypecase v
    (integer "an integer")
    (string "a string")))

(print (safe-describe 5))
