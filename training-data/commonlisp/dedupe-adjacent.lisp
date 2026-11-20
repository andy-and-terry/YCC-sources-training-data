;; Remove consecutive duplicates.
(defun dedupe (l)
  (loop for x in l for prev = nil then cur for cur = x
        unless (eql x prev) collect x))
(print (coerce (dedupe (coerce "aabbbcdd" 'list)) 'string))
