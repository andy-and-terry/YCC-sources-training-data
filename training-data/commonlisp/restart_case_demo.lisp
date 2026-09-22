(defun parse-integer-safe (str)
  (restart-case
      (if (every #'digit-char-p str)
          (parse-integer str)
          (error "Invalid integer: ~a" str))
    (use-value (value) value)
    (use-zero () 0)))

(defun parse-with-recovery (str)
  (handler-bind
      ((error (lambda (c)
                (declare (ignore c))
                (invoke-restart 'use-zero))))
    (parse-integer-safe str)))

(print (parse-integer-safe "42"))
(print (parse-with-recovery "abc"))
