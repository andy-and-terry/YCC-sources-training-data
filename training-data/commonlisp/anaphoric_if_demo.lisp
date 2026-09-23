(defmacro aif (test then &optional else)
  `(let ((it ,test))
     (if it ,then ,else)))

;; AIF intentionally captures the symbol IT in its expansion so the THEN
;; branch can refer to the test's value without the caller naming it.
(print (aif (find-if #'evenp '(1 3 4 5)) (* it 10) :none))
(print (aif (find-if #'evenp '(1 3 5 7)) (* it 10) :none))

(defmacro awhen (test &body body)
  `(aif ,test (progn ,@body) nil))

(awhen (position 5 '(1 2 5 8))
  (format t "found 5 at index ~a~%" it))
