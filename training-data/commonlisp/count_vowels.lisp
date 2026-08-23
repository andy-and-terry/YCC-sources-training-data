(defun count-vowels (s)
  (count-if (lambda (c) (find c "aeiou")) s))

(print (count-vowels "hello world"))
