(defclass app-config ()
  ((settings :initform (make-hash-table) :accessor config-settings)))

(defvar *config-instance* nil)

(defun get-config ()
  (unless *config-instance*
    (setf *config-instance* (make-instance 'app-config))
    (format t "creating the one and only config instance~%"))
  *config-instance*)

(defun set-setting (key value)
  (setf (gethash key (config-settings (get-config))) value))

(defun get-setting (key)
  (gethash key (config-settings (get-config))))

(set-setting :timeout 30)
(print (get-setting :timeout))
(print (eq (get-config) (get-config)))
