;;; Thue-Morse: t(n) is the parity of the number of 1 bits in n
(format t "~{~d~}~%"
        (loop for n from 0 below 32
              collect (mod (logcount n) 2)))
