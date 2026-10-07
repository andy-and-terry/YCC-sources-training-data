#lang racket

(define (shift-char c shift)
  (cond
    [(char-lower-case? c) (rotate c shift (char->integer #\a))]
    [(char-upper-case? c) (rotate c shift (char->integer #\A))]
    [else c]))

(define (rotate c shift base)
  (integer->char (+ base (modulo (+ (- (char->integer c) base) shift) 26))))

(define (caesar str shift)
  (list->string (for/list ([c (in-string str)]) (shift-char c shift))))

(define secret (caesar "Hello, World!" 3))
(displayln secret)
(displayln (caesar secret -3))
