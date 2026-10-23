(defun factorial (n)
  (if (<= n 1) 1 (* n (factorial (1- n)))))

(let ((f (factorial 30)))
  (format t "30! = ~D~%" f)
  (format t "digits: ~D~%" (length (princ-to-string f)))
  (format t "bits:   ~D~%" (integer-length f))
  (format t "fixnum? ~A~%" (typep f 'fixnum))
  (format t "digit sum: ~D~%"
          (reduce #'+ (map 'list #'digit-char-p (princ-to-string f)))))
