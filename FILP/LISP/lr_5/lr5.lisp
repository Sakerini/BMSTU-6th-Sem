;1
(defun first_even_after (num)
    (if (equal (mod num 2) 0)
        num
        (+ num 1)
    )
)

;2
(defun abs_plus_one (num)
    (if (> num 0) 
        (+ num 1) 
        (- num 1))
)

;3
(defun sort_two_numbers (num1 num2)
    (if (< num1 num2)
        (list num1 num2)
        (list num2 num1)
    )
)

;4
(defun between_two_numbers (num num1 num2)
    (cond
        ((and (> num num1) (< num num2)) T)
        ((and (< num num1) (> num num2)) T)
        (Nil)
    )
)

;6
(defun more_or_equal (num1 num2)
    (cond
        ((> num1 num2) T)
        ((equal num1 num2) T)
        (Nil)
    )
)

;7
(defun pred1 (x)
    (and (numberp x) (plusp x))
)

(defun pred2 (x)
    (and (plusp x) (numberp x))
)

;8
(defun between_two_numbers (num num1 num2)
    (if (or
            (and (< num num1) (> num num2))
            (and (> num num1) (< num num2))
        )
        T
        Nil
    )
)

(print (between_two_numbers 1 2 3)) ;;; Nil
(print (between_two_numbers 2 1 3)) ;;; T
(print (between_two_numbers 2 3 1)) ;;; T