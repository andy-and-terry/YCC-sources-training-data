#lang racket

(define (count-vowels s)
  (for/sum ([c (in-string s)])
    (if (memv (char-downcase c) '(#\a #\e #\i #\o #\u)) 1 0)))
(displayln (count-vowels "Racket Is Awesome"))

(define (caesar-shift c k)
  (cond [(char-lower-case? c)
         (integer->char (+ 97 (modulo (+ (- (char->integer c) 97) k) 26)))]
        [(char-upper-case? c)
         (integer->char (+ 65 (modulo (+ (- (char->integer c) 65) k) 26)))]
        [else c]))
(displayln (list->string (map (lambda (c) (caesar-shift c 3)) (string->list "Hello, World"))))

(displayln (for/list ([c (in-string "abc")] [i (in-naturals 1)]) (cons c i)))
(displayln (string-upcase "shout"))
(displayln (build-string 5 (lambda (i) (integer->char (+ 65 i)))))
(displayln (string-append* (map (lambda (s) (string-append s "!")) '("a" "b"))))
(displayln (string<? "apple" "banana"))
