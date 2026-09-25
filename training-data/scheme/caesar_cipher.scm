;; Caesar cipher: shift each lowercase letter by a fixed amount, wrapping
;; around the alphabet; decoding just shifts by the negative amount.

(define (shift-char c shift)
  (if (char-alphabetic? c)
      (let* ((base (char->integer #\a))
             (offset (modulo (+ (- (char->integer (char-downcase c)) base) shift) 26)))
        (integer->char (+ base offset)))
      c))

(define (caesar-encode s shift)
  (list->string (map (lambda (c) (shift-char c shift)) (string->list s))))

(define (caesar-decode s shift)
  (caesar-encode s (- 26 (modulo shift 26))))

(define encoded (caesar-encode "hello world" 3))
(display encoded)
(newline)
(display (caesar-decode encoded 3))
(newline)
