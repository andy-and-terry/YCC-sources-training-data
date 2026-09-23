#lang racket

;; A proxy stands in for another object, adding behavior (here: lazy
;; loading and access logging) around the real subject.

(define (make-real-image filename)
  (printf "loading image from disk: ~a\n" filename)
  (lambda () (printf "displaying ~a\n" filename)))

(define (make-proxy-image filename)
  (define real-image #f)
  (lambda ()
    (unless real-image
      (set! real-image (make-real-image filename)))
    (real-image)))

(define image (make-proxy-image "photo.png"))
(printf "proxy created, nothing loaded yet\n")
(image)
(image)
