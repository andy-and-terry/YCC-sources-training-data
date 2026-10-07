(defun risky (fail)
  (unwind-protect
      (progn
        (format t "acquiring resource~%")
        (when fail (error "something broke"))
        (format t "work done~%")
        :ok)
    (format t "cleanup always runs~%")))

(print (risky nil))
(print (handler-case (risky t)
         (error (e) (format nil "caught: ~a" e))))

;; cleanup also runs on non-local exit
(print (block done
         (unwind-protect (return-from done :early)
           (format t "cleanup after return-from~%"))))
(terpri)
