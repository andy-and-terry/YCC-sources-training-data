(defun build-lps (pattern)
  (let* ((m (length pattern))
         (lps (make-array m :initial-element 0))
         (len 0)
         (i 1))
    (loop while (< i m) do
      (cond
        ((char= (char pattern i) (char pattern len))
         (incf len)
         (setf (aref lps i) len)
         (incf i))
        ((> len 0)
         (setf len (aref lps (1- len))))
        (t
         (setf (aref lps i) 0)
         (incf i))))
    lps))

(defun kmp-search (text pattern)
  (let* ((n (length text))
         (m (length pattern))
         (lps (build-lps pattern))
         (i 0) (j 0))
    (loop while (< i n) do
      (cond
        ((char= (char text i) (char pattern j))
         (incf i) (incf j)
         (when (= j m) (return-from kmp-search (- i j))))
        ((> j 0) (setf j (aref lps (1- j))))
        (t (incf i))))
    -1))

(format t "~a~%" (kmp-search "abxabcabcaby" "abcaby"))
(format t "~a~%" (kmp-search "hello world" "xyz"))
