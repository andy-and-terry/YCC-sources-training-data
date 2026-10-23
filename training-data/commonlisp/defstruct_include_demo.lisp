;; defstruct :include gives single-inheritance for structures. The child
;; inherits all slots and accessors, and parent accessors work on children.
(defstruct shape
  (name "shape")
  (sides 0))

(defstruct (rectangle (:include shape (name "rectangle") (sides 4)))
  (width 1)
  (height 1))

(defstruct (square (:include rectangle (name "square")))
  )

(defun area (s)
  (etypecase s
    (rectangle (* (rectangle-width s) (rectangle-height s)))
    (shape 0)))

(let ((r (make-rectangle :width 3 :height 4))
      (sq (make-square :width 5 :height 5))
      (s (make-shape)))
  (format t "~a has ~a sides, area ~a~%" (shape-name r) (shape-sides r) (area r))
  (format t "~a has ~a sides, area ~a~%" (shape-name sq) (shape-sides sq) (area sq))
  (format t "~a has ~a sides, area ~a~%" (shape-name s) (shape-sides s) (area s))
  (format t "square is a rectangle: ~a~%" (typep sq 'rectangle))
  (format t "square is a shape: ~a~%" (typep sq 'shape))
  (format t "rectangle is a square: ~a~%" (typep r 'square))
  (format t "square-width via parent accessor: ~a~%" (rectangle-width sq)))
