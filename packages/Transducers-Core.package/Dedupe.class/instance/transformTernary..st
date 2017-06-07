*Transducers-transforming
transformTernary: aReducingFunction
	
	| previous |
	previous := Object new.
	^[:result :key :value | 
	value = previous
		ifTrue: [result]
		ifFalse:
			[previous := value.
			aReducingFunction value: result value: key value: value]]