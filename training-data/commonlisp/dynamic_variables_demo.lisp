(defvar *log-prefix* "LOG")

(defun log-message (msg)
  (format t "[~a] ~a~%" *log-prefix* msg))

(defun run-with-prefix (prefix thunk)
  (let ((*log-prefix* prefix))
    (funcall thunk)))

(log-message "starting")
(run-with-prefix "DEBUG" (lambda () (log-message "inside dynamic scope")))
(log-message "back to default")
