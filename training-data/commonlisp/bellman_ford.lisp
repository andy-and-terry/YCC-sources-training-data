(defparameter *edges*
  '((0 1 4) (0 2 5) (1 2 -3) (2 3 4) (1 3 6)))

(defun bellman-ford (edges n-vertices source)
  (let ((dist (make-array n-vertices :initial-element most-positive-fixnum)))
    (setf (aref dist source) 0)
    (dotimes (_ (1- n-vertices))
      (dolist (edge edges)
        (destructuring-bind (u v w) edge
          (when (and (< (aref dist u) most-positive-fixnum)
                     (< (+ (aref dist u) w) (aref dist v)))
            (setf (aref dist v) (+ (aref dist u) w))))))
    dist))

(let ((distances (bellman-ford *edges* 4 0)))
  (dotimes (i (length distances))
    (format t "~a: ~a~%" i (aref distances i))))
