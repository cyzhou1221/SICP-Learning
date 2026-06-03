#lang sicp

(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b) ; #false
(if (and (> b a) (< b (* a b))) ;4
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a)) ;16
      (else 25))
(+ 2 (if (> b a) b a))    ;6
(* (cond ((> a b) a)
         ((< a b) b)      ;16
         (else -1))
   (+ a 1))
