;; 1
(defun f-to-c (temp)
    (* (/ 5 9) (- temp 320))
)

(print (f-to-c 451))

;; 2
(print (list 'cons t NIL))
(print (eval (list 'eval NIL)))

;; 3

(defun leg (hypotenuse another)
    (sqrt (- (* hypotenuse hypotenuse) (* another another)))
)

(print (leg 5 4)) ;;; 3.0

;; 4

(defun square (footing1 footing2 height)
    (* (/ (+ footing1 footing2) 2) height)
)

(print (square 2 2 2)) ;;; 4
(square 2 4 5) ;;; 15