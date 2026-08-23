(defun palindrome-p (s)
  (string= s (reverse s)))

(print (palindrome-p "racecar"))
(print (palindrome-p "hello"))
