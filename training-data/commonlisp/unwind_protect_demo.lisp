;; unwind-protect guarantees the cleanup forms run however control leaves.
(defvar *log* '())

(defun note (msg)
  (push msg *log*))

(defun risky (n)
  (unwind-protect
       (progn
         (note (format nil "start ~a" n))
         (when (zerop n)
           (error "zero is not allowed"))
         (/ 100 n))
    (note (format nil "cleanup ~a" n))))

(print (risky 5))
(print (handler-case (risky 0)
         (error (e) (format nil "caught: ~a" e))))

;; non-local exit via return-from also triggers cleanup
(defun find-first-even (list)
  (dolist (x list)
    (unwind-protect
         (when (evenp x)
           (return-from find-first-even x))
      (note (format nil "checked ~a" x)))))

(print (find-first-even '(1 3 4 5)))
(print (reverse *log*))
