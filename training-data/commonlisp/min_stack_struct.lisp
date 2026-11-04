(defstruct min-stack (items nil))

(defun ms-push (s x)
  (let ((m (if (min-stack-items s) (min x (cdr (first (min-stack-items s)))) x)))
    (push (cons x m) (min-stack-items s))))

(defun ms-pop (s) (car (pop (min-stack-items s))))
(defun ms-min (s) (cdr (first (min-stack-items s))))

(let ((s (make-min-stack)))
  (dolist (v '(5 3 7 2)) (ms-push s v))
  (format t "~a~%" (ms-min s))
  (ms-pop s)
  (format t "~a~%" (ms-min s)))
