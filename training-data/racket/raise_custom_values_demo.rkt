#lang racket

;; raise accepts any value, not only exn structures.

(struct http-error (status message) #:transparent)

(define (fetch path)
  (cond
    [(equal? path "/") "home page"]
    [(equal? path "/admin") (raise (http-error 403 "forbidden"))]
    [(equal? path "/boom") (raise 'internal-failure)]
    [else (raise (http-error 404 "not found"))]))

(define (safe-fetch path)
  (with-handlers ([http-error?
                   (lambda (e)
                     (format "~a ~a" (http-error-status e) (http-error-message e)))]
                  [symbol?
                   (lambda (s) (format "symbol raised: ~a" s))])
    (fetch path)))

(for ([p '("/" "/admin" "/missing" "/boom")])
  (displayln (safe-fetch p)))

;; Handlers can re-raise to an outer handler.
(define result
  (with-handlers ([string? (lambda (s) (string-append "outer got " s))])
    (with-handlers ([number? (lambda (n) (raise "converted"))])
      (raise 42))))
(displayln result)
