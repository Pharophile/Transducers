*Transducers-transforming
transformBinary: aReducingFunction
	
	| previous |
	previous := Object new.
	^[:result :value | 
	value = previous
		ifTrue: [result]
		ifFalse:
			[previous := value.
			aReducingFunction value: result value: value]]