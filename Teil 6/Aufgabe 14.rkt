;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Datenstruktur, die einen Punkt mit den Koordinaten (x,y) beschreibt
;; x,y sind Zahlen
(define-struct punkt [x y])

;; Hilfsdefinition
(define ursprung (make-punkt 0 0))

;; Datenstruktur, die einen Kreis mit dem Mittelpunkt mittelpunkt und dem Radius r beschreibt
;; mittelpunkt ist ein punkt, r ist eine Zahl >= 0
(define-struct kreis [m r])


;; Berechnet die distanz zwischen zweit punkten
;; punkt1 & punkt2 sind punkte
(define distanz
  (lambda [punkt1 punkt2]
    (sqrt
      (+
       (expt (- (punkt-x punkt1) (punkt-x punkt2)) 2)
       (expt (- (punkt-y punkt1) (punkt-y punkt2)) 2)
       ))))

;; Beispielanwendungen
(= (distanz (make-punkt 1.5 2) ursprung) 2.5)
(= (distanz (make-punkt 2 2) (make-punkt 2 2)) 0)
(= (distanz (make-punkt 0 2) (make-punkt 0 -3)) 5)

;; Funktion, die überprüft, ob ein punkt in einem Kreis liegt
;; punkt ist ein punkt, kreis ist ein kreis
(define punkt-in-kreis?
  (lambda [punkt kreis]
    (>= (kreis-r kreis)
        (distanz punkt (kreis-m kreis)))))


;; Beispielanwendungen
(punkt-in-kreis? ursprung (make-kreis ursprung 3))
(punkt-in-kreis? (make-punkt 0 3) (make-kreis ursprung 3))
(not (punkt-in-kreis? (make-punkt 0 10) (make-kreis ursprung 3)))