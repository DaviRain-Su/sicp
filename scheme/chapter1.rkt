;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chapter1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;1.1.1 表达式 expression

; display 486
486

;; cal 1 + 2 = 3
(+ 1 2)

;; cal 21 + 35 + 12 + 7
(+ 21 35 12 7)

;; cal 1000 - 334
(- 1000 334)

;; cal 5 * 99
(* 5 99)

;; cal 10 / 5
(/ 10 5)

;; 25 * 4 * 12
(* 25 4 12)

;; 3 * 5 + (10 - 6)
(+ (* 3 5) (- 10 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

;; 1.1.2 命名和环境

(define size 2)
size
(* 5 size)
(define PI 3.14159)

(define radius 10)

(* PI (* radius radius))

(define circumference (* 2 PI radius))
circumference

;; define square function
(define (square x) (* x x))

(square 21)
(square (+ 2 5))

;; define x^2 + y^2
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

;; 1.1.3 条件表达式和谓词
(define (Abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

;;(cond (<p1> <e1>)
;;      (<p2> <e2>)
;;      (<pn> <en>))

(define (Abs1 x)
  (cond ((< x 0) (- x))
         (else x )))

;; (if <predicate> <consequent> <alternative>)

(define (Abs2 x)
  (if (< x 0)
      (- x)
      x))

(Abs -1)

;; (and <e1> ... <en>)
;; (or <e1> ... <en>)
;; (no <e>)
(define x 4)
(and (> x 5) (< x 10))
;;(define (>= x y)
;;  (or (> x y) (= x y)))

;; (define (>= x y)
;;  (not (< x y)))

;; Exercise1
;;

10 ;; 10
(+ 5 3 4) ;; 12
(- 9 1) ;;8
(/ 6 2) ;; 3
(+ (* 2 4) (- 4 6)) ;; 6
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;; Exercise 2
(/ (+ 5 4 (- 2
             (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; exercise 3
(define (two-numbers-max a b)
  (cond ((> a b) a)
        (else b)))
(define (two-numbers-min a b)
  (cond ((< a b) a)
        (else b)))

(two-numbers-max 1 2)

(define (thress-numbers-max-sum a b c)
  (+ (two-numbers-max a b)
     (two-numbers-max
      (two-numbers-min a b)
      c)))

(thress-numbers-max-sum 3 2 1)


;; exercise 4
(define (a-plus-abs-b a b)
  (+ a (if (> b 0) b (- b))))

(a-plus-abs-b 1 2)
(a-plus-abs-b 1 -1)

;; exercise 5
;; todo
;;(define p 4)
;;(define (p) (p))
;;(define (test x y)
;;  (if (= x 0)
;;      0
;;      y))

;;1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (mysqrt x)
  (sqrt-iter 1.0 x))

(mysqrt 9)
(mysqrt (+ 100 37))
(mysqrt (+ (mysqrt 2) (mysqrt 3)))
(square (mysqrt 1000))


;;; exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;; todo
;;; exercise 1.7

;; todo
;;; exercise 1.8
;;(define (cubic-iter guess x)
;;  (if (cubic-good-enough? guess x)
;;      guess
;;      (cubic-iter (improve guess x)
;;                 x)))

;;(define (improve guess x)
;;  (average guess (/ x guess)))

;;(define (average x y)
;;  (/ (+ x y) 2))

;;(define (cubic-good-enough? guess x)
;;  (< (abs (- (cubic-pproximate x guess) x)) 0.001))


;;(define (cubic-pproximate x y)
;;  (/ (+ (/ x (square y)) (* 2 y))
;;     3))

;;(define (cubic x)
;;  (cubic-iter 1.0 x))

;;(cubic 9)

;;; 1.1.8

;(define (sqrt x)
;  (define (good-enough? guess x)
;    (< (abs (- (square guess) x)) 0.001))
;  (define (improve guess x)
;    (average guess (/ x guess)))
;  (define (sqrt-iter guess x)
;    (if (good-enough? guess x)
;        guess
;        (sqrt-iter (improve guess x) x)))
;  (sqrt-iter 1.0 x))

;; 1.2.1

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 6)

(define (factorial-iter n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
(factorial-iter 6)


;(define (factorial-iter-a n)
;  (define (iter product counter)
;    (if (> counter n)
;        product
;        (iter (* counter product)
;              (+ counter 1))))
;  (iter 1 1))
;(factorial-iter-a 6)

;; todo
;; 1.9


;; todo
;; 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
(f 1)

;; 1.2.2
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1 ) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 5)
(fib 6)

(define (fibi n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fibi 5)
(fibi 100)
    