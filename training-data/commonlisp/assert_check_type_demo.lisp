;; assert, check-type and etypecase: run-time validation with useful errors.
(defun safe-sqrt (x)
  (check-type x (real 0) "a non-negative real number")
  (sqrt x))

(defun average (numbers)
  (assert (and (listp numbers) numbers) (numbers)
          "average needs a non-empty list, got ~s" numbers)
  (/ (reduce #'+ numbers) (length numbers)))

(defun describe-value (v)
  (etypecase v
    (integer (format nil "integer ~d" v))
    (string (format nil "string of length ~d" (length v)))
    (symbol (format nil "symbol ~a" v))))

(print (safe-sqrt 16))
(print (handler-case (safe-sqrt -4)
         (type-error (e) (format nil "type-error: ~a" (type-error-datum e)))))
(print (average '(1 2 3 4)))
(print (handler-case (average '())
         (simple-error () "assertion failed")))
(print (describe-value 42))
(print (describe-value "hello"))
(print (handler-case (describe-value 3.5)
         (error () "no matching etypecase clause")))
