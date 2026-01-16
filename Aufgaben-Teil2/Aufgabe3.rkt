;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define a
  (lambda [n]
    (+ (expt n 2) 1)))

(= (a 3) 10)
(= (a 2) 5)
(= (a 1) 2)


(define b
  (lambda [n]
    (+ (* (/ 1 2) (expt n 2)) 3)))

(= (b 3) 7.5)
(= (b 2) 5)
(= (b 1) 3.5)

(define c
  (lambda [n]
    (- 2 (/ 1 n))))

(= (c 2) 1.5)
(= (c 1) 1)