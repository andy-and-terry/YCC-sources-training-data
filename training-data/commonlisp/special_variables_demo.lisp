;; Dynamic (special) variables vs lexical variables.
(defvar *indent* 0)
(defparameter *verbose* nil)

(defun say (fmt &rest args)
  (format t "~&~a~?~%" (make-string *indent* :initial-element #\Space) fmt args))

(defun walk (tree)
  (cond ((null tree) nil)
        ((atom tree) (say "leaf ~a" tree))
        (t (say "node with ~d children" (length tree))
           (let ((*indent* (+ *indent* 2)))     ; rebinding is visible to callees
             (mapc #'walk tree)))))

(walk '(1 (2 3) (4 (5))))
(say "back at indent ~d" *indent*)

;; special declarations inside a let
(defun show-verbose () *verbose*)
(print (let ((*verbose* t)) (show-verbose)))
(print (show-verbose))

;; lexical closures do not see rebinding
(let ((counter 0))
  (defun bump () (incf counter)))
(bump)
(print (bump))

;; progv binds symbols chosen at run time
(print (progv '(*indent*) '(10) *indent*))
(print *indent*)
