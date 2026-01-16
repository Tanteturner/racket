;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname kino) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define eintritts-preis 500)
(define fixkosten-vorstellung 2000)
(define variable-kosten 50)


;; Berechnet die Kosten für ein Kino bei einer bestimmten Besucherzahl
(define kosten
  (lambda [besucherzahl]
    (+ (* besucherzahl variable-kosten) fixkosten-vorstellung)))

;; Beispielaufrufe
(= (kosten 1) 2050)
(= (kosten 10) 2500)
(= (kosten 100) 7000)


;; Berechnet den Umsatz für ein Kino bei einer bestimmten Besucherzahl
(define umsatz
  (lambda [besucherzahl]
    (* besucherzahl eintritts-preis)))

;; Beispielaufrufe
(= (umsatz 1) 500)
(= (umsatz 10) 5000)
(= (umsatz 100) 50000)


;; Berechnet den Profit für ein Kino bei einer bestimmten Besucherzahl
(define profit
  (lambda [besucherzahl]
    (- (umsatz besucherzahl) (kosten besucherzahl))))

;; Beispielaufrufe
(= (profit 1) -1550)
(= (profit 10) 2500)
(= (profit 100) 43000)