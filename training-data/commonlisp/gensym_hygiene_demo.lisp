(defmacro my-or-unsafe (a b)
  `(let ((temp ,a))
     (if temp temp ,b)))

(defmacro my-or-safe (a b)
  (let ((temp (gensym "TEMP")))
    `(let ((,temp ,a))
       (if ,temp ,temp ,b))))

;; Capture bug: the macro's own internal TEMP shadows the caller's
;; TEMP, so the second form silently evaluates to the wrong value.
(let ((temp 5))
  (print (my-or-unsafe nil temp)))

;; GENSYM gives the internal binding a name nothing else can collide
;; with, so the caller's TEMP is visible in the second form as expected.
(let ((temp 5))
  (print (my-or-safe nil temp)))
