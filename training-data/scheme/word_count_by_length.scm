(define (split-words str)
  (let loop ((cs (string->list str)) (cur '()) (out '()))
    (cond ((null? cs) (reverse (if (null? cur) out (cons (list->string (reverse cur)) out))))
          ((char=? (car cs) #\space) (loop (cdr cs) '() (if (null? cur) out (cons (list->string (reverse cur)) out))))
          (else (loop (cdr cs) (cons (car cs) cur) out)))))

(define (count-by-length words)
  (let loop ((ws words) (table '()))
    (if (null? ws)
        (sort table (lambda (a b) (< (car a) (car b))))
        (let* ((len (string-length (car ws))) (entry (assv len table)))
          (loop (cdr ws)
                (if entry
                    (begin (set-cdr! entry (+ (cdr entry) 1)) table)
                    (cons (cons len 1) table)))))))

(display (count-by-length (split-words "the quick brown fox jumps over the lazy dog")))
(newline)
