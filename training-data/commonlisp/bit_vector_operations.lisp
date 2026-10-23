;; Bit vectors: compact arrays of 0/1 with built-in logical operations

(let ((a (make-array 8 :element-type 'bit :initial-contents '(1 1 0 0 1 0 1 0)))
      (b (make-array 8 :element-type 'bit :initial-contents '(1 0 1 0 1 1 0 0))))
  (format t "a        = ~a~%" a)
  (format t "b        = ~a~%" b)
  (format t "and      = ~a~%" (bit-and a b))
  (format t "or       = ~a~%" (bit-ior a b))
  (format t "xor      = ~a~%" (bit-xor a b))
  (format t "not a    = ~a~%" (bit-not a))
  (format t "count 1s = ~a~%" (count 1 a))
  (format t "bit 4 of a = ~a~%" (bit a 4)))

;; Literal syntax and mutation with setf
(let ((flags (make-array 6 :element-type 'bit :initial-element 0)))
  (setf (bit flags 2) 1
        (sbit flags 5) 1)
  (format t "flags = ~a~%" flags)
  (format t "literal = ~a~%" #*10110)
  (format t "equal literals: ~a~%" (equal #*101 #*101)))

;; Sieve of Eratosthenes on a bit vector
(let ((sieve (make-array 30 :element-type 'bit :initial-element 1)))
  (setf (bit sieve 0) 0 (bit sieve 1) 0)
  (loop for i from 2 below 30
        when (= 1 (bit sieve i))
          do (loop for j from (* i i) below 30 by i
                   do (setf (bit sieve j) 0)))
  (format t "primes: ~a~%"
          (loop for i below 30 when (= 1 (bit sieve i)) collect i)))
