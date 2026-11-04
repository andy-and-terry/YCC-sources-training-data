(defun ordinal (n)
  (let ((r100 (mod n 100)) (r10 (mod n 10)))
    (format nil "~a~a" n
            (cond ((<= 11 r100 13) "th")
                  ((= r10 1) "st")
                  ((= r10 2) "nd")
                  ((= r10 3) "rd")
                  (t "th")))))

(format t "~{~a ~}~%" (mapcar #'ordinal '(1 2 3 4 11 12 13 21 101 111)))
