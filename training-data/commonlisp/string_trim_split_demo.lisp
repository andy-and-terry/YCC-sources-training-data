(defun split-string (string &optional (delim #\space))
  (loop with start = 0
        for pos = (position delim string :start start)
        collect (subseq string start pos)
        while pos
        do (setf start (1+ pos))))

(format t "~s~%" (split-string "a,b,,c" #\,))
(format t "~s~%" (split-string "one two three"))
(format t "~s~%" (string-trim " 	" "  padded  "))
(format t "~s~%" (string-left-trim "0" "000120"))
(format t "~s~%" (string-right-trim ".!" "wow!!.."))
