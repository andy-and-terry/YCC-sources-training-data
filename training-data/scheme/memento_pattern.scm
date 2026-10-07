;; The memento pattern captures an object's internal state so it can
;; be restored later. A record makes an opaque, well-typed memento.

(define-record-type memento
  (make-memento state)
  memento?
  (state memento-state))

(define (make-editor) (list ""))

(define (editor-type! editor text)
  (set-car! editor (string-append (car editor) text)))

(define (editor-save editor)
  (make-memento (car editor)))

(define (editor-restore! editor a-memento)
  (set-car! editor (memento-state a-memento)))

(define editor (make-editor))
(editor-type! editor "Hello")
(define checkpoint (editor-save editor))
(editor-type! editor ", world!")
(display "before undo: ") (display (car editor)) (newline)

(editor-restore! editor checkpoint)
(display "after undo: ") (display (car editor)) (newline)
