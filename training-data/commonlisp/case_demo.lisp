(defun describe-token (x)
  (case x
    ((1 2 3) 'small)
    ((10 20 30) 'round)
    (:keyword 'a-keyword)
    ((nil) 'nothing)
    (otherwise 'other)))

(defun char-kind (c)
  (ecase c
    ((#\a #\e #\i #\o #\u) :vowel)
    ((#\b #\c #\d) :consonant)))

(format t "~a~%" (mapcar #'describe-token '(2 20 :keyword nil 99)))
(format t "~a ~a~%" (char-kind #\a) (char-kind #\c))
(format t "~a~%"
        (handler-case (char-kind #\z)
          (error () "no match: ecase signals an error")))
