(defparameter *scores* '(("Ada" . 88) ("Bob" . 72) ("Cleo" . 95)))

(print (cdr (assoc "Ada" *scores* :test #'string=)))
(dolist (pair *scores*)
  (format t "~a: ~a~%" (car pair) (cdr pair)))
