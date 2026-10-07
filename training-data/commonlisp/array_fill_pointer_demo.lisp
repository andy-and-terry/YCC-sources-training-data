(defparameter *buf* (make-array 2 :adjustable t :fill-pointer 0))

(dotimes (i 5)
  (vector-push-extend (* i i) *buf*))

(format t "contents: ~a~%" *buf*)
(format t "length: ~d~%" (length *buf*))
(format t "popped: ~d~%" (vector-pop *buf*))
(format t "after pop: ~a~%" *buf*)

(let ((grid (make-array '(2 3) :initial-element 0)))
  (setf (aref grid 1 2) 9)
  (format t "grid: ~a dims: ~a~%" grid (array-dimensions grid)))
