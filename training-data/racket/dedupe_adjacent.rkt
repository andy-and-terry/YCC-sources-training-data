#lang racket
;; Remove consecutive duplicates.
(define (dedupe lst)
  (for/list ([x lst] [prev (cons #f lst)] #:unless (eqv? x prev)) x))
(displayln (list->string (dedupe (string->list "aabbbcdd"))))
