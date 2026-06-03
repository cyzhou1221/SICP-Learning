#lang sicp

(define (average x y) (/ (+ x y) 2))

(define (fixed-point f x)
  (define tol 0.00001)
  (define x_new (f x))
  (if (< (abs (- x_new x)) tol)
      x_new
      (fixed-point f x_new)))

(define (sqrt x)
  ; 定义一个过程名为 average-damp，该过程以过程为参数，返回值也是过程
  (define average-damp
    (lambda (f)
      (lambda (x) (average (f x) x))))
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1))

(sqrt 25.0)

; solve square root by Newton Method
(define (square x) (* x x))

(define dx 0.00000001)
(define derive
  (lambda (f)
    (lambda (x) (/ (- (f (+ x dx))
                      (f x))
                   dx))))

(define (newton f guess)
  (define df (derive f))
  (fixed-point (lambda (x)
                  (- x (/ (f x) (df x))))
               guess))

(define (sqrt-newton x)
  (newton (lambda (y) (- (square y) x))
          1))

(sqrt-newton 144.0)