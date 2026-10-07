#lang racket

(define (make-chat-room)
  (box (hash))) ; name -> handler procedure

(define (register! room name handler)
  (set-box! room (hash-set (unbox room) name handler)))

(define (relay room sender message)
  (for ([(name handler) (in-hash (unbox room))])
    (unless (equal? name sender)
      (handler sender message))))

(define room (make-chat-room))
(register! room "alice" (lambda (sender msg) (printf "alice received from ~a: ~a\n" sender msg)))
(register! room "bob" (lambda (sender msg) (printf "bob received from ~a: ~a\n" sender msg)))

(relay room "alice" "hi bob")
(relay room "bob" "hey alice")
