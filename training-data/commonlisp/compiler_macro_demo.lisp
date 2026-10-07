(defun my-expt (base power)
  (expt base power))

;; When POWER is the literal integer 2 at compile time, calls to MY-EXPT
;; are rewritten into a plain multiplication instead of a general EXPT
;; call; any other call is left as ordinary FORM, unoptimized.
(define-compiler-macro my-expt (&whole form base power)
  (if (and (integerp power) (= power 2))
      `(let ((b ,base)) (* b b))
      form))

(print (my-expt 5 2))
(print (my-expt 2 10))
