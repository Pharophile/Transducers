*Transducers-transforming
transformTernary: aReducingFunction
	
	| count |
	count := n.
	^[:result :key :value | 
	count > 0
		ifTrue:
			[count := count - 1.
			aReducingFunction value: result value: key value: value]
		ifFalse: [Reduced signalWith: result]]