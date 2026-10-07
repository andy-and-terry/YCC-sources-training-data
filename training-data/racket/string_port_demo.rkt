#lang racket

;; String ports let you treat an in-memory string as a readable or
;; writable stream, reusing ordinary I/O procedures.
(define out (open-output-string))
(write 'hello out)
(display " " out)
(display 42 out)
(displayln (get-output-string out))

;; with-output-to-string captures everything printed inside the thunk.
(define captured
  (with-output-to-string
    (lambda ()
      (for ([i (in-range 3)])
        (printf "line ~a\n" i)))))
(display captured)

;; Reading back from a string as if it were a file.
(define in (open-input-string "10 20 30"))
(define numbers (for/list ([_ (in-range 3)]) (read in)))
(displayln numbers)
(displayln (apply + numbers))
