(defun lyndon-p (w)
  (loop for i from 1 below (length w)
        always (string< w (subseq w i))))

(defun factor (s)
  (when (plusp (length s))
    (let ((len (loop for n from (length s) downto 1
                     when (lyndon-p (subseq s 0 n)) return n)))
      (cons (subseq s 0 len) (factor (subseq s len))))))

(print (factor "banana"))
