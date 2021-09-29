(defun select-between (lst a b)
	(remove-if	#'(lambda (x) 
		(and 
			(or (< x a)(> x b)) 
			(or (> x a)(< x b))
		)
	  )lst
	)
)