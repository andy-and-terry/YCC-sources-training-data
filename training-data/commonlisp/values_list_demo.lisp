;; values-list spreads a list into multiple values;
;; multiple-value-list does the reverse.
(defun three () (values-list '(1 2 3)))

(multiple-value-bind (a b c) (three)
  (format t "~a ~a ~a~%" a b c))

(format t "~a~%" (multiple-value-list (three)))

;; Spread a computed list into a call needing several values.
(multiple-value-bind (q r) (values-list (multiple-value-list (floor 17 5)))
  (format t "quotient ~a remainder ~a~%" q r))

;; Extra values are dropped, missing ones become NIL.
(multiple-value-bind (x y z w) (values-list '(10 20))
  (format t "~a ~a ~a ~a~%" x y z w))
