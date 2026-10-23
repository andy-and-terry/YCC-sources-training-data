;; Reader macros change how source text is parsed, before evaluation.
;; set-macro-character installs a handler for one character.
(defun read-bracket-list (stream char)
  (declare (ignore char))
  (cons 'list (read-delimited-list #\] stream t)))

(set-macro-character #\[ #'read-bracket-list)
(set-macro-character #\] (get-macro-character #\)) nil)

(format t "~a~%" [1 2 3])
(format t "~a~%" [(+ 1 2) (* 3 4)])

;; A dispatching macro character: #? reads the next form and wraps it.
(defun read-debug-form (stream subchar arg)
  (declare (ignore subchar arg))
  (let ((form (read stream t nil t)))
    `(let ((value ,form))
       (format t "~s => ~s~%" ',form value)
       value)))

(set-dispatch-macro-character #\# #\? #'read-debug-form)

#?(+ 2 3)
#?(reverse '(a b c))

;; Reader macros are global to the readtable; restore it when finished.
(setf *readtable* (copy-readtable nil))
(format t "~a~%" (read-from-string "(1 2 3)"))
