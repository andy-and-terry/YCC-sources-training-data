;; Low-level iteration with tagbody and go.
(defun count-down (n)
  (let ((i n))
    (tagbody
     top
       (when (zerop i) (go done))
       (format t "~d " i)
       (decf i)
       (go top)
     done
       (format t "liftoff!~%"))))

(count-down 5)

(print (do ((i 0 (1+ i))
            (acc nil (cons i acc)))
           ((= i 5) (nreverse acc))))
(terpri)
