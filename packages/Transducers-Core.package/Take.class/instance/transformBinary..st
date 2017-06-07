*Transducers-transforming
transformBinary: aReducingFunction
	
	| count |
	count := n.
	^[:result :value | 
	count > 0
		ifTrue:
			[count := count - 1.
			aReducingFunction value: result value: value]
		ifFalse: [Reduced signalWith: result]]