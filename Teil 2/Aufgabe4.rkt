;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define a
  (lambda [l b h]
    (* l b h)))

(a 1 1 1)
(a 1 2 3)

(define b
  (lambda [dist velA velB] ;; dist in m, vel in m/s
    (/ dist (+ velA velB))))

(b 1000 10 5)

(define c
  (lambda [anzahlBahnhöfe]
    (* (expt 2 (- anzahlBahnhöfe 2)) 1000)))

(c 1)
(c 2)
(c 3)
(c 4)

