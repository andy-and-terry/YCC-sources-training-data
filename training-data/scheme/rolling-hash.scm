(define (window-hash str start k)
  (let loop ((i start) (h 0))
    (if (= i (+ start k))
        h
        (loop (+ i 1) (modulo (+ (* h 31) (char->integer (string-ref str i))) 1000003)))))

(define s "abcabc")
(do ((i 0 (+ i 1))) ((> i (- (string-length s) 3)))
  (display i) (display " ") (display (window-hash s i 3)) (newline))
