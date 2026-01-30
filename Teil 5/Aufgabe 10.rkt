;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; Funktion, die Notenpunkte in Schulnoten umrechnet
;; punkte ist eine Zahl von 0 bis 15
(define notenumrechnung
  (lambda [punkte]
    (cond
      [(>= punkte 13) 1]
      [(>= punkte 10) 2]
      [(>= punkte 7) 3]
      [(>= punkte 4) 4]
      [(>= punkte 1) 5]
      [else 6]
      )))

;; Beispielanwendungen
(= (notenumrechnung 14) 1)
(= (notenumrechnung 7) 3)
(= (notenumrechnung 0) 6)

