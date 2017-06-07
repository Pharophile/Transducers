*Transducers-transforming
transformTernary: aReducingFunction
	
	| count |
	count := n.
	^[:result :key :value | 
	count > 0
		ifTrue:
			[count := count - 1.
			result]
		ifFalse: [aReducingFunction value: result value: key value: value]]