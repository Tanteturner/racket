;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Errechnet die diskriminante für eine quadratische Gleichung der Form: ax^2 + bx + c
;; Wobei a, b & c Reelle Zahlen sind
(define diskriminante
  (lambda [a b c]
    (- (* b b) (* 4 a c))))

;; Beispielanwendungen
(= (diskriminante 1 2 -5) 24)
(= (diskriminante 1 2 1) 0)
(= (diskriminante 1 2 5) -16)

;; Errechnet die Anzahl der Nullstellen für eine quadratische Gleichung der Form: ax^2 + bx + c
;; Wobei a, b & c Reelle Zahlen sind
(define anzahl-der-nullstellen
  (lambda [a b c]
    (cond
      [(= a 0)
       (cond
         [(= b 0)
          (cond
            [(= c 0) +inf.0]
            [else 0])]
         [else 1])]
      [else 
       (cond
         [(= (diskriminante a b c) 0) 1]
         [(> (diskriminante a b c) 0) 2]
         [else 0])])))

;; Beispielanwendungen
(= (anzahl-der-nullstellen 1 2 -3) 2)
(= (anzahl-der-nullstellen 1 2 1) 1)
(= (anzahl-der-nullstellen -1 2 -5) 0)

(= (anzahl-der-nullstellen 0 0 0) +inf.0)
(= (anzahl-der-nullstellen 0 2 3) 1)
(= (anzahl-der-nullstellen 0 0 3) 0)