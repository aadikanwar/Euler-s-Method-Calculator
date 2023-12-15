;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname eulers) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@htdf eulers-method)
(@signature Number Number Number Number -> Number)
;; calculator for approx. solutions to DE's via Euler's Method,

;(check-expect (eulers-method 0 0.04 0 -1) -1) 
;(check-expect (eulers-method 0.04 0.04 0 -1) -1.12)
;(check-expect (eulers-method 0.2 0.04 0 -1) -1.7443037184)

(@template-origin Number)

(define (eulers-method desired-x step-size init-x init-y)
  (cond [(= init-x desired-x) init-y]
        [else
         (eulers-method desired-x step-size
                        (+ init-x step-size)
                        (formula init-x init-y step-size))]))


(@htdf user-differential-equation)
(@signature Number Number -> Number)
;; DE used in calculator (sample for dy/dx = 3y + x, change this accordingly
;(check-expect (user-differential-equation 0 0) 0)
;(check-expect (user-differential-equation 0 -1) -3)

(@template-origin Number)

(define (user-differential-equation x y)
  (+ (* 3 y) x))

(@htdf formula)
(@signature Number Number Number -> Number)
;; Euler's formula used in calculation y-value
;(check-expect (formula 0 0 0) 0)
;(check-expect (formula 0 -1 0.04) -1.12)

(@template-origin Number)

(define (formula x y h)
  (+ y (* h (user-differential-equation x y))))
