;; Integer bit operations
(print (logand #b1100 #b1010))
(print (logior #b1100 #b1010))
(print (logxor #b1100 #b1010))
(print (lognot 5))
(print (ash 1 10))
(print (ash 1024 -3))
(print (logcount 255))
(print (integer-length 255))
(print (logbitp 2 #b100))
(print (ldb (byte 4 4) #xAB))          ; extract bits 4..7 -> 10
(print (dpb #b1111 (byte 4 0) #xA0))   ; deposit into low nibble -> #xAF

;; Bit vectors
(let ((bv (make-array 8 :element-type 'bit :initial-element 0)))
  (setf (sbit bv 1) 1
        (sbit bv 3) 1)
  (print bv)
  (print (bit-not bv))
  (print (bit-and bv #*00001010))
  (print (bit-ior bv #*00001010))
  (print (bit-xor bv #*00001010))
  (print (count 1 bv)))

;; Sets of small integers as bit masks
(defun mask-of (list)
  (reduce #'logior (mapcar (lambda (n) (ash 1 n)) list)))
(print (logand (mask-of '(1 2 3)) (mask-of '(3 4))))
