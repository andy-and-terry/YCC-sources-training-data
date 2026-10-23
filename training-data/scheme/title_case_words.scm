;; Title-casing words with char-upcase and string-downcase.

(define (capitalize word)
  (if (= (string-length word) 0)
      word
      (string-append
       (string (char-upcase (string-ref word 0)))
       (string-downcase (substring word 1 (string-length word))))))

(define (split-words str)
  (let loop ((chars (string->list str)) (cur '()) (acc '()))
    (cond ((null? chars)
           (reverse (if (null? cur) acc (cons (list->string (reverse cur)) acc))))
          ((char=? (car chars) #\space)
           (loop (cdr chars) '() (if (null? cur) acc (cons (list->string (reverse cur)) acc))))
          (else (loop (cdr chars) (cons (car chars) cur) acc)))))

(define (join-words words)
  (if (null? words)
      ""
      (fold-left-join words)))

(define (fold-left-join words)
  (let loop ((rest (cdr words)) (acc (car words)))
    (if (null? rest)
        acc
        (loop (cdr rest) (string-append acc " " (car rest))))))

(define (title-case str)
  (join-words (map capitalize (split-words str))))

(display (title-case "the qUICK brown   fox")) (newline)
(display (title-case "hello")) (newline)
(write (title-case "")) (newline)
