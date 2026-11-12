(defun show (&rest args)
  (destructuring-bind (a b &key (c 0) &allow-other-keys) args
    (list a b c)))
(print (show 1 2 :c 3 :z 9))
(print (show 1 2))
