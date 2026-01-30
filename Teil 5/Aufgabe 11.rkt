;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Aufgabe 11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Berechnet das nettoeinkommen nach einer Bestimmten Steuersatztabelle
;; bruttoeinkommen ist eine Zahl >= 0
(define nettoeinkommen
  (lambda [bruttoeinkommen]
    (cond
      [(<= bruttoeinkommen 5000) bruttoeinkommen]
      [(<= bruttoeinkommen 10000) (+ 5000 (* 0.85 (- bruttoeinkommen 5000)))]
      [else (+ 5000 (* 0.85 5000) (* 0.8 (- bruttoeinkommen 10000)))])))


;; Beispielanwendungen
(= (nettoeinkommen 1001) 1001)
(= (nettoeinkommen 5001) 5000.85)
(= (nettoeinkommen 10000) 9250)
(= (nettoeinkommen 10001) 9250.8)
(= (nettoeinkommen 15000) 13250)