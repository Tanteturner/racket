;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Berechnet die Bahnhofsmiete in Monopoly
;; anzahl-bahnhöfe entspricht der Anzahl der Bahnhöfe, die der Vermieter besitzt
(define miete-bahnhof
  (lambda [anzahl-bahnhöfe]
    (* (expt 2 (- anzahl-bahnhöfe 2)) 1000)))

;; Beispielanwendungen
(= (miete-bahnhof 1) 500)
(= (miete-bahnhof 2) 1000)
(= (miete-bahnhof 3) 2000)
(= (miete-bahnhof 4) 4000)
