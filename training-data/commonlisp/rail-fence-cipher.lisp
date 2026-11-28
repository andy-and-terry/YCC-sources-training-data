(defun rail-of (i rails)
  (let* ((period (* 2 (1- rails))) (m (mod i period)))
    (if (< m rails) m (- period m))))

(defun encode (text rails)
  (let ((keyed (loop for c across text for i from 0 collect (list (rail-of i rails) i c))))
    (coerce (mapcar #'third
                    (sort keyed (lambda (a b)
                                  (or (< (first a) (first b))
                                      (and (= (first a) (first b)) (< (second a) (second b)))))))
            'string)))

(format t "~a~%" (encode "WEAREDISCOVERED" 3))
