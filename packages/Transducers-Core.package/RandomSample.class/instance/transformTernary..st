*Transducers-transforming
transformTernary: aReducingFunction
	
	^[:result :key :value | 
	random next <= probability
		ifTrue: [aReducingFunction value: result value: key value: value]
		ifFalse: [result]]