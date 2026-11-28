(let ((pairs '((a . 1) (b . 2) (c . 3))))
  (print (loop for (k . v) in pairs
               when (oddp v) collect k
               sum v into total
               finally (return (list total)))))
