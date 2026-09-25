;; Longest common CONTIGUOUS substring of two strings via dynamic
;; programming (unlike the longest common SUBSEQUENCE, which need not
;; be contiguous).

(define (longest-common-substring a b)
  (define la (string-length a))
  (define lb (string-length b))
  (define table (make-vector (* (+ la 1) (+ lb 1)) 0))
  (define (idx i j) (+ (* i (+ lb 1)) j))
  (define best-len 0)
  (define best-end 0)
  (let loop-i ((i 1))
    (if (<= i la)
        (begin
          (let loop-j ((j 1))
            (if (<= j lb)
                (begin
                  (if (char=? (string-ref a (- i 1)) (string-ref b (- j 1)))
                      (let ((len (+ 1 (vector-ref table (idx (- i 1) (- j 1))))))
                        (vector-set! table (idx i j) len)
                        (if (> len best-len)
                            (begin (set! best-len len) (set! best-end i))))
                      (vector-set! table (idx i j) 0))
                  (loop-j (+ j 1)))))
          (loop-i (+ i 1)))))
  (substring a (- best-end best-len) best-end))

(display (longest-common-substring "abcdefg" "xycdefz"))
(newline)
