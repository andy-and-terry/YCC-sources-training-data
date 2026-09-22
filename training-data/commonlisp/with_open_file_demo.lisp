(defparameter *scratch-path* "/tmp/commonlisp-with-open-file-demo.txt")

(with-open-file (out *scratch-path*
                      :direction :output
                      :if-exists :supersede
                      :if-does-not-exist :create)
  (dolist (line '("first line" "second line" "third line"))
    (write-line line out)))

(with-open-file (in *scratch-path* :direction :input)
  (loop for line = (read-line in nil :eof)
        until (eq line :eof)
        do (format t "read: ~a~%" line)))

(delete-file *scratch-path*)
