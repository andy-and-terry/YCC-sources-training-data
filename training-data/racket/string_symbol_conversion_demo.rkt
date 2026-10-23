#lang racket

;; Symbols are interned; strings are not. Convert between them explicitly.
(define s 'hello)
(displayln (symbol->string s))
(displayln (string->symbol "hello world"))
(writeln (string->symbol "hello world"))

(displayln (eq? 'abc (string->symbol "abc")))
(displayln (eq? "abc" (string-append "a" "bc")))
(displayln (equal? "abc" (string-append "a" "bc")))

;; Uninterned symbols are never eq? to an interned one.
(define g (string->uninterned-symbol "abc"))
(displayln (eq? g 'abc))
(displayln (symbol-interned? g))

;; Build identifiers programmatically
(define (accessor-name field)
  (string->symbol (format "get-~a" field)))
(displayln (accessor-name 'width))

(displayln (symbol<? 'apple 'banana))
(displayln (map symbol->string '(a b c)))
