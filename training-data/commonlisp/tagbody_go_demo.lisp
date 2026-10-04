;; tagbody/go is the primitive behind do and loop.
(let ((i 0))
  (tagbody
   start
     (when (>= i 5) (go end))
     (format t "i = ~a~%" i)
     (incf i)
     (go start)
   end)
  (format t "finished with i = ~a~%" i))
