(define (count-char c s)
  (let loop ((i 0) (n 0))
    (if (= i (string-length s))
        n
        (loop (+ i 1) (if (char=? c (string-ref s i)) (+ n 1) n)))))

(define (self-describing? s)
  (let loop ((i 0))
    (or (= i (string-length s))
        (and (= (count-char (integer->char (+ 48 i)) s)
                (- (char->integer (string-ref s i)) 48))
             (loop (+ i 1))))))

(for-each (lambda (s)
            (display s) (display " ")
            (display (self-describing? s)) (newline))
          '("1210" "2020" "21200" "1211"))
