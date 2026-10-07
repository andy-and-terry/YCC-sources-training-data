(defun word-break-p (s dictionary)
  (let* ((n (length s))
         (dp (make-array (1+ n) :initial-element nil)))
    (setf (aref dp 0) t)
    (loop for i from 1 to n do
      (loop for j from 0 below i do
        (when (and (aref dp j)
                   (member (subseq s j i) dictionary :test #'string=))
          (setf (aref dp i) t)
          (return))))
    (aref dp n)))

(format t "~a~%" (word-break-p "leetcode" '("leet" "code")))
(format t "~a~%" (word-break-p "leetcoded" '("leet" "code")))
