(defun modes (items)
  (let ((counts (make-hash-table)) (top 0) (result '()))
    (dolist (x items)
      (setf top (max top (incf (gethash x counts 0)))))
    (maphash (lambda (k c) (when (= c top) (push k result))) counts)
    (sort result #'<)))

(format t "~a~%" (modes '(1 2 2 3 3 4)))
