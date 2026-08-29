#lang racket

(define (binary->decimal s)
  (string->number s 2))

(displayln (binary->decimal "1011"))
