(defun fletcher16 (s)
  (let ((s1 0) (s2 0))
    (loop for c across s
          do (setf s1 (mod (+ s1 (char-code c)) 255)
                   s2 (mod (+ s2 s1) 255)))
    (logior (ash s2 8) s1)))

(format t "~(~x~)~%" (fletcher16 "abcde"))
