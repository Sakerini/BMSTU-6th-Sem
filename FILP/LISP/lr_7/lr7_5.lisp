(defun swap-to-left (lst k)
	(cond 
		(
			(<= k 0) 
			lst
		)
		(
			(swap-to-left 
				(nconc
					(cdr lst)
					(cons (car lst) nil)
				)
				(- k 1)
			)
		)
	)
)

(defun swap-to-right (lst k)
	(cond 
		(
			(<= k 0) 
			lst
		)
		(
			(swap-to-right 
			(nconc 
				(mapcon #'(lambda (el)
					(cond
						(
							(null (cdr el))
							el
						)
					)
			   	  ) lst
				)
				(mapcon #'(lambda (el)
					(cond
						(
							(cdr el)
							(cons (car el) nil)
						)
					)
				   ) lst
				)
			)
			(- k 1)
		)
	  )
	)
)