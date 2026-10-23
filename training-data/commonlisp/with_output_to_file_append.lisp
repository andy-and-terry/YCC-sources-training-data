(defparameter *path* "/tmp/lisp_append_demo.txt")

(with-open-file (out *path* :direction :output :if-exists :supersede)
  (format out "line one~%"))

(with-open-file (out *path* :direction :output :if-exists :append)
  (format out "line two~%"))

(with-open-file (in *path*)
  (loop for line = (read-line in nil nil)
        for n from 1
        while line
        do (format t "~D: ~A~%" n line)))

(delete-file *path*)
