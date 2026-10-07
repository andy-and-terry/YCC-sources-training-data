;; The Z-algorithm builds an array where z[i] is the length of the
;; longest substring starting at i that matches a prefix of the string;
;; used here for pattern matching via "pattern$text".

(define (z-array s)
  (define n (string-length s))
  (define z (make-vector n 0))
  (let loop ((i 1) (l 0) (r 0))
    (if (< i n)
        (let ((k (if (< i r) (min (- r i) (vector-ref z (- i l))) 0)))
          (let extend ((k k))
            (if (and (< (+ i k) n) (char=? (string-ref s k) (string-ref s (+ i k))))
                (extend (+ k 1))
                (begin
                  (vector-set! z i k)
                  (if (> (+ i k) r)
                      (loop (+ i 1) i (+ i k))
                      (loop (+ i 1) l r))))))
        z)))

(define (z-search text pattern)
  (define combined (string-append pattern "$" text))
  (define z (z-array combined))
  (define m (string-length pattern))
  (let loop ((i (+ m 1)) (matches '()))
    (if (>= i (vector-length z))
        (reverse matches)
        (loop (+ i 1)
              (if (= (vector-ref z i) m) (cons (- i m 1) matches) matches)))))

(display (z-search "abxabcabcaby" "abc"))
(newline)
