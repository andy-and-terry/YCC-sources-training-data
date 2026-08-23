(defun word-frequency (text)
  (let ((counts (make-hash-table :test 'equal)))
    (dolist (word (split-string text))
      (incf (gethash word counts 0)))
    counts))

(defun split-string (s)
  (loop for start = 0 then (1+ pos)
        for pos = (position #\Space s :start start)
        collect (subseq s start pos)
        while pos))

(let ((freq (word-frequency "the quick brown fox jumps over the lazy dog the fox runs")))
  (maphash (lambda (k v) (format t "~a: ~a~%" k v)) freq))
