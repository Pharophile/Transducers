*Transducers-Core-reducing
reduceValues: aReducingFunction init: value
	
	^self
		inject: value
		into: aReducingFunction nonCompleting