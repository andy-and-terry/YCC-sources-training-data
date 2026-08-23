(defun make-greeting (name &key (greeting "Hello") (punctuation "!"))
  (format nil "~a, ~a~a" greeting name punctuation))

(print (make-greeting "Ada"))
(print (make-greeting "Bob" :greeting "Hi" :punctuation "?"))
