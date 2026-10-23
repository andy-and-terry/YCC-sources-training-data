;; defconstant names a value that must not change; the compiler may
;; inline it, so redefining with a non-eql value is an error.
(defconstant +max-retries+ 3)
(defconstant +tax-rate+ 0.2)

;; Re-evaluating with an eql value is allowed (e.g. when reloading).
(defconstant +max-retries+ 3)

(format t "constant? ~a~%" (constantp '+max-retries+))
(format t "retries: ~a~%" +max-retries+)
(format t "price with tax: ~,2f~%" (* 50 (+ 1 +tax-rate+)))

;; Constants cannot be rebound or assigned.
(format t "~a~%"
        (handler-case (progn (eval '(setq +max-retries+ 5)) "changed")
          (error () "cannot assign to a constant")))
