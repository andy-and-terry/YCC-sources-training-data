(defparameter *flags* (make-array 8 :element-type 'bit :initial-element 0))

(defun set-flag (bits index)
  (setf (sbit bits index) 1))

(defun flag-set-p (bits index)
  (= (sbit bits index) 1))

(set-flag *flags* 2)
(set-flag *flags* 5)

(format t "vector: ~a~%" *flags*)
(format t "bit 2 set: ~a~%" (flag-set-p *flags* 2))
(format t "bit 3 set: ~a~%" (flag-set-p *flags* 3))
(format t "population count: ~a~%" (count 1 *flags*))
