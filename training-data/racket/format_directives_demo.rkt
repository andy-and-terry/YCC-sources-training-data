#lang racket
;; format / printf directives: ~a display, ~s write, ~v print, ~e, ~%, ~~

(define v '("hi" #\x 3.5 sym))

(printf "~a\n" v)    ; display style: no quotes
(printf "~s\n" v)    ; write style: strings quoted, chars as #\x
(printf "~v\n" v)    ; print style (like REPL)

(displayln (format "~a + ~a = ~a" 2 3 (+ 2 3)))
(displayln (format "tilde: ~~ and newline:~%next"))

;; ~e is a synonym for error-style (write) in older code; use ~s.
(displayln (format "quoted: ~s" "text"))

;; Padding and number formatting come from racket/format.
(displayln (~a "left" #:min-width 10 #:pad-string "."))
(displayln (~a "right" #:min-width 10 #:align 'right #:left-pad-string "."))
(displayln (~r 3.14159 #:precision 2))
(displayln (~r 255 #:base 16 #:min-width 4 #:pad-string "0"))
(displayln (~s "q"))

;; Wrong argument count is a runtime error.
(with-handlers ([exn:fail? (lambda (e) (displayln "format arity error"))])
  (format "~a ~a" 1))
