;; Naive substring search and replace-all on strings.

(define (string-index-of str pat start)
  (let ((n (string-length str)) (m (string-length pat)))
    (let loop ((i start))
      (cond ((> (+ i m) n) #f)
            ((string=? (substring str i (+ i m)) pat) i)
            (else (loop (+ i 1)))))))

(define (string-replace-all str pat rep)
  (let loop ((start 0) (acc ""))
    (let ((idx (string-index-of str pat start)))
      (if idx
          (loop (+ idx (string-length pat))
                (string-append acc (substring str start idx) rep))
          (string-append acc (substring str start (string-length str)))))))

(write (string-index-of "hello world" "world" 0)) (newline)
(write (string-index-of "hello" "xyz" 0)) (newline)
(write (string-replace-all "a-b-c-d" "-" "+")) (newline)
(write (string-replace-all "banana" "an" "AN")) (newline)
