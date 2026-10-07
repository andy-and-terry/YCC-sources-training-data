#lang racket

(define b (bytes 72 101 108 108 111))
(displayln b)
(displayln (bytes->string/utf-8 b))
(displayln (string->bytes/utf-8 "héllo"))
(displayln (bytes-length (string->bytes/utf-8 "héllo")))

(define buf (make-bytes 4 0))
(bytes-set! buf 0 255)
(displayln buf)
(displayln (bytes-ref buf 0))

(displayln (integer->integer-bytes 258 2 #f #t))
(displayln (integer-bytes->integer (bytes 1 2) #f #t))
(displayln (bytes-append #"ab" #"cd"))
(displayln (subbytes #"abcdef" 2 4))
(displayln (for/list ([x (in-bytes #"AB")]) x))
