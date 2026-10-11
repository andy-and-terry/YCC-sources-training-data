#lang racket

(define (connect #:host host #:port [port 80] #:tls? [tls? #f])
  (format "~a://~a:~a" (if tls? "https" "http") host port))

(displayln (connect #:host "x.org"))
(displayln (connect #:host "x.org" #:port 443 #:tls? #t))
(displayln (keyword-apply connect '(#:host #:port) '("y.org" 8080) '()))
(define opts (list "z.org"))
(displayln (keyword-apply connect '(#:host) opts '()))
(displayln (procedure-arity connect))

(define (log-msg level . parts)
  (string-append "[" (symbol->string level) "] " (string-join parts " ")))
(displayln (log-msg 'info "a" "b"))
(displayln (apply log-msg 'warn '("x" "y" "z")))
(define (opt-args a [b 2] [c (+ a b)]) (list a b c))
(displayln (opt-args 1))
(displayln (opt-args 1 10))
(displayln (opt-args 1 10 100))
