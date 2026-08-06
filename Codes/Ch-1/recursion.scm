#lang sicp

(define (fib n)
  (if (<= n 1)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(fib 4)
(fib 5)
(fib 6)

(define (new-fib n) 
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(new-fib 4)
(new-fib 5)
(new-fib 6)

; 例子：找零钱
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)

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