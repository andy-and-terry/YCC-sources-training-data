(defmacro square-twice-bad (form)
  `(* ,form ,form))

(defmacro square-safe (form)
  (let ((v (gensym "V")))
    `(let ((,v ,form)) (* ,v ,v))))

(defvar *calls* 0)
(defun tick () (incf *calls*))

(setf *calls* 0)
(format t "bad: ~a, calls=~a~%" (square-twice-bad (tick)) *calls*)
(setf *calls* 0)
(format t "safe: ~a, calls=~a~%" (square-safe (tick)) *calls*)
