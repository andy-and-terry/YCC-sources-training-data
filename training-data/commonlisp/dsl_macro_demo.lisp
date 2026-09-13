(defvar *check-count* 0)
(defvar *fail-count* 0)

(defmacro check (description form)
  `(progn
     (incf *check-count*)
     (if ,form
         (format t "PASS: ~a~%" ,description)
         (progn
           (incf *fail-count*)
           (format t "FAIL: ~a~%" ,description)))))

(defmacro deftest (name &body checks)
  `(defun ,name ()
     ,@checks
     (format t "~a: ~a/~a passed~%" ',name (- *check-count* *fail-count*) *check-count*)))

(deftest arithmetic-tests
  (check "addition" (= (+ 2 3) 5))
  (check "multiplication" (= (* 2 3) 6))
  (check "wrong on purpose" (= (+ 1 1) 3)))

(arithmetic-tests)
