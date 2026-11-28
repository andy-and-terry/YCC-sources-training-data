(define (bwt s)
  (let* ((n (string-length s))
         (rots (map (lambda (i) (string-append (substring s i n) (substring s 0 i)))
                    (iota n)))
         (sorted (sort rots string<?)))
    (list->string (map (lambda (r) (string-ref r (- n 1))) sorted))))

(display (bwt "banana$")) (newline)
