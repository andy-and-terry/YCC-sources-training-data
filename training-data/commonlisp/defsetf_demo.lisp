(defstruct point x y)

;; A plain function to read the "magnitude-squared" of a point ...
(defun point-mag-sq (p) (+ (* (point-x p) (point-x p)) (* (point-y p) (point-y p))))

;; ... and a setf-expander that lets callers write (setf (point-x-scaled p) v)
;; even though there is no real POINT-X-SCALED slot: it rescales x so that
;; the point's x-coordinate becomes v, leaving y untouched.
(defun point-x-scaled (p) (point-x p))

(defsetf point-x-scaled (p) (new-value)
  `(setf (point-x ,p) ,new-value))

(let ((p (make-point :x 3 :y 4)))
  (format t "before: x=~a y=~a mag-sq=~a~%" (point-x p) (point-y p) (point-mag-sq p))
  (setf (point-x-scaled p) 6)
  (format t "after:  x=~a y=~a mag-sq=~a~%" (point-x p) (point-y p) (point-mag-sq p)))

;; define-setf-expander form of the same idea, giving full control over the
;; generated get/set/temp forms. Unlike defsetf, it can compose with the
;; underlying place's own setf-expansion (via GET-SETF-EXPANSION) so that
;; "pushing" onto (history-of place) writes back through to PLACE itself,
;; whatever kind of place that turns out to be.
(defun history-of (place-list) (car place-list))

(define-setf-expander history-of (place)
  (multiple-value-bind (temps vals stores setter getter)
      (get-setf-expansion place)
    (let ((new-value (gensym)))
      (values temps
              vals
              (list new-value)
              `(let ((,(car stores) (cons ,new-value ,getter)))
                 ,setter
                 ,new-value)
              `(car ,getter)))))

(let ((log (list 1)))
  (setf (history-of log) 2)
  (setf (history-of log) 3)
  (format t "log after pushes: ~a~%" log))
