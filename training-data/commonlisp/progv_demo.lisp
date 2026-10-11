(defvar *a* :global-a)
(defvar *b* :global-b)

(defun show () (list *a* *b*))

(format t "~a~%" (show))
(format t "~a~%" (progv '(*a* *b*) '(1 2) (show)))
(format t "~a~%" (progv '(*a*) '(only-a) (show)))
(format t "~a~%" (show))
