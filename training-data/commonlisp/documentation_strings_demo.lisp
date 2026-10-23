;; Documentation strings for functions, variables, and types

(defun area (width height)
  "Return the area of a rectangle WIDTH by HEIGHT."
  (* width height))

(defvar *max-items* 100
  "Upper limit on the number of items a batch may hold.")

(defstruct (point (:constructor make-point (x y)))
  "A point in the plane."
  x y)

(defmacro twice (form)
  "Evaluate FORM two times and return the second result."
  `(progn ,form ,form))

(format t "function: ~a~%" (documentation 'area 'function))
(format t "variable: ~a~%" (documentation '*max-items* 'variable))
(format t "type:     ~a~%" (documentation 'point 'structure))
(format t "macro:    ~a~%" (documentation 'twice 'function))

;; Docstrings can be replaced at run time
(setf (documentation 'area 'function)
      "Rectangle area; both arguments must be non-negative.")
(format t "updated:  ~a~%" (documentation 'area 'function))

;; Undocumented symbols return NIL
(defun helper (x) (1+ x))
(format t "helper doc: ~a~%" (documentation 'helper 'function))
