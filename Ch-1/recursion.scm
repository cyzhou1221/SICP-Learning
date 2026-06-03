#lang sicp

(define (fib n)
  (if (<= n 1)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(fib 4)
(fib 5)
(fib 6)

; sum from a to b, integers
(define (sum-int a b)
  (if (> a b)
      0
      (+ a
         (sum-int (+ a 1)
                  b))))

(display "sum integers program\n")
(sum-int 4 3)
(sum-int 4 5)
(sum-int 4 6)

; sum to get pi/8 with index from a to b
(define (pi-sum a b)
  (define (term i) (/ 8
                      (* (- (* i 4) 3)
                         (- (* i 4) 1))))
  (if (> a b)
      0
      (+ (term a)
         (pi-sum (+ a 1) b))))

(pi-sum 1.0 10)
(pi-sum 1.0 100)
(pi-sum 1.0 1000000)

; another equivalent program, function as an argument
(define (sum-program term a b)
  (if (> a b)
      0
      (+ (term a)
         (sum-program term (+ 1 a) b))))

(define (term-1 i) (/ 8
                      (* (- (* i 4) 3)
                         (- (* i 4) 1))))

(sum-program term-1 1.0 1000000)