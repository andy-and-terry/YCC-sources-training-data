(defpackage :math-utils
  (:use :cl)
  (:export :square :cube))

(in-package :math-utils)

(defun square (x) (* x x))
(defun cube (x) (* x x x))

(in-package :cl-user)

(format t "~a~%" (math-utils:square 5))
(format t "~a~%" (math-utils:cube 3))
