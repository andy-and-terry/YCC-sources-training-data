(defstruct person name (age 0) (tags nil))

(let* ((p (make-person :name "Ada" :age 36))
       (q (copy-person p)))
  (setf (person-age q) 37)
  (push :math (person-tags q))
  (format t "~a ~a ~a~%" (person-name p) (person-age p) (person-age q))
  (format t "~s ~a~%" (person-tags q) (person-p q)))
