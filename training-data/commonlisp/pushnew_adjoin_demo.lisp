(defvar *tags* '("lisp" "clos"))

(pushnew "macros" *tags* :test #'string=)
(pushnew "lisp" *tags* :test #'string=)
(format t "~s~%" *tags*)

(let ((base '(1 2 3)))
  (format t "~a ~a~%" (adjoin 2 base) (adjoin 9 base))
  (format t "base unchanged: ~a~%" base))
