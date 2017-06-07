*Transducers-transforming
transform: aReducingFunction
	
	^[:result :value | 
	value
		reduce: aReducingFunction nonCompleting
		init: result
		pass: true] completing: [:result | aReducingFunction complete: result]