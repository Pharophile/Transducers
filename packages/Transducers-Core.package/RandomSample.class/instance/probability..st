*Transducers-private
probability: aProbability
	
	(aProbability between: 0 and: 1)
		ifFalse: [self error: 'Probablitiy expected to be between 0 and 1.'].
	probability := aProbability