;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Datenstrukur, welche die Vergangende Zeit seit Mitternacht beschreibt
;; stunden, minuten und sekunden sind Zahlen
(define-struct zeitpunkt-seit-mitternacht [stunden minuten sekunden])


;; Berechnet die Zeit in sekunden aus einer zeitpunkt-seit-mitternacht struktur
(define zeit-in-sekunden
  (lambda [zeit]
    (+ (zeitpunkt-seit-mitternacht-sekunden zeit)
       (* (zeitpunkt-seit-mitternacht-minuten zeit) 60)
       (* (zeitpunkt-seit-mitternacht-stunden zeit) 60 60))))

;; Beispielanwendungen
(= (zeit-in-sekunden (make-zeitpunkt-seit-mitternacht 0 0 0)) 0)
(= (zeit-in-sekunden (make-zeitpunkt-seit-mitternacht 0 0 1)) 1)
(= (zeit-in-sekunden (make-zeitpunkt-seit-mitternacht 0 1 0)) 60)
(= (zeit-in-sekunden (make-zeitpunkt-seit-mitternacht 1 0 0)) 3600)
(= (zeit-in-sekunden (make-zeitpunkt-seit-mitternacht 2 10 5)) 7805)






