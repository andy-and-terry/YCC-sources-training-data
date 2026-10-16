(format t "~a~%" (mismatch "flower" "flow"))
(format t "~a~%" (mismatch "abc" "abc"))
(format t "~a~%" (mismatch '(1 2 3 4) '(1 2 9 4)))
(format t "~a~%" (mismatch "hello" "jello" :from-end t))

(defun common-prefix (a b)
  (subseq a 0 (or (mismatch a b) (length a))))

(format t "~s~%" (common-prefix "interstellar" "internet"))
(format t "~a~%" (search "net" "internet"))
