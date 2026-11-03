(defun count-vowels (s)
  (let ((text (string-downcase s)))
    (loop for v across "aeiou"
          collect (cons v (count v text)))))

(format t "~a~%" (count-vowels "Education is beautiful"))
