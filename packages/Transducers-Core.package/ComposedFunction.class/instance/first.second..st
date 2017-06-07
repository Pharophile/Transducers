*Transducers-private
first: firstFunction second: secondFunction
	
	secondFunction arity = 1
		ifFalse: [self error: 'Second function must be of arity one.'].
	first := firstFunction.
	second := secondFunction