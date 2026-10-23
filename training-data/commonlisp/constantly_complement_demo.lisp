;; constantly and complement build small functions from existing values

(defparameter *nums* '(1 2 3 4 5 6 7 8))

;; constantly returns a function that ignores its arguments
(let ((always-zero (constantly 0)))
  (format t "constantly: ~a ~a~%" (funcall always-zero) (funcall always-zero 1 2 3)))

(format t "replace all with 0: ~a~%" (mapcar (constantly 0) *nums*))

;; complement negates a predicate
(let ((odd-p (complement #'evenp)))
  (format t "odd via complement: ~a~%" (remove-if-not odd-p *nums*)))

(format t "not divisible by 3: ~a~%"
        (remove-if (complement (lambda (n) (plusp (mod n 3)))) *nums*))

;; Both combine well with sequence functions
(defun fetch-or-default (table key)
  (gethash key table (funcall (constantly :missing))))

(let ((table (make-hash-table)))
  (setf (gethash :a table) 1)
  (format t "lookup :a -> ~a~%" (fetch-or-default table :a))
  (format t "lookup :b -> ~a~%" (fetch-or-default table :b)))

(format t "count non-nil: ~a~%"
        (count-if (complement #'null) '(1 nil 2 nil nil 3)))
