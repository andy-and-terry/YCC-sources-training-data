(define (varint n)
  (if (< n 128)
      (list n)
      (cons (+ (modulo n 128) 128) (varint (quotient n 128)))))

(display (varint 300))
(newline)
