(defpackage :shapes-a
  (:use :cl)
  (:export :area))

(in-package :shapes-a)
(defun area (side) (* side side))

(in-package :cl-user)

(defpackage :shapes-b
  (:use :cl)
  (:export :area))

(in-package :shapes-b)
(defun area (radius) (* pi radius radius))

(in-package :cl-user)

;; Both packages export a symbol named AREA, so USE-PACKAGE-ing both would
;; conflict; qualifying each call by its package keeps them distinct.
(format t "square area: ~a~%" (shapes-a:area 4))
(format t "circle area: ~a~%" (shapes-b:area 2))

(defpackage :shapes-combined
  (:use :cl)
  (:shadowing-import-from :shapes-b :area))

(in-package :shapes-combined)
(format t "combined package uses shapes-b's area: ~a~%" (area 3))

(in-package :cl-user)
