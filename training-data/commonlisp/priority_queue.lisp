(defparameter *heap* (make-array 0 :adjustable t :fill-pointer 0))

(defun pq-swap (i j)
  (rotatef (aref *heap* i) (aref *heap* j)))

(defun pq-push (value)
  (vector-push-extend value *heap*)
  (let ((i (1- (fill-pointer *heap*))))
    (loop while (> i 0) do
      (let ((parent (floor (1- i) 2)))
        (if (< (aref *heap* i) (aref *heap* parent))
            (progn (pq-swap i parent) (setf i parent))
            (return))))))

(defun pq-pop ()
  (let ((top (aref *heap* 0))
        (last (1- (fill-pointer *heap*))))
    (setf (aref *heap* 0) (aref *heap* last))
    (decf (fill-pointer *heap*))
    (let ((i 0))
      (loop
        (let ((left (1+ (* 2 i))) (right (+ 2 (* 2 i))) (smallest i))
          (when (and (< left (fill-pointer *heap*)) (< (aref *heap* left) (aref *heap* smallest)))
            (setf smallest left))
          (when (and (< right (fill-pointer *heap*)) (< (aref *heap* right) (aref *heap* smallest)))
            (setf smallest right))
          (if (= smallest i) (return) (progn (pq-swap i smallest) (setf i smallest))))))
    top))

(dolist (v '(5 2 8 1 9 3))
  (pq-push v))

(loop repeat 6 do (format t "~a " (pq-pop)))
(format t "~%")
