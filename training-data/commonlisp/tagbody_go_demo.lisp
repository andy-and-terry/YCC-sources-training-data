;; TAGBODY/GO is the low-level construct underneath loops
(let ((i 0))
  (tagbody
   top
     (when (>= i 5) (go end))
     (format t "i = ~d~%" i)
     (incf i)
     (go top)
   end
     (format t "done~%")))

(defun count-down (n)
  (prog ((k n))
   again
     (when (zerop k) (return :liftoff))
     (format t "~d " k)
     (decf k)
     (go again)))

(print (count-down 3))
(terpri)
