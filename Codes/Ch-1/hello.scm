#lang sicp

; the first program
(begin
    (display "Hello, World!")
    (newline)
)

(+ (* 3 (+ 7 19.5)) 4)

(+ (* 3 5)
   (* 47
      (- 20 6.8))
   12)

; define variables
(define A (* 5 5))
(* A A)
(define B (+ A
             (* 5 A)))
B
(+ A (/ B 5))

; define functions
(define (square x) (* x x))
(square 10)

(define (sum-of-squares x y)
        (+ (square x)
           (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

(define (abs x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))