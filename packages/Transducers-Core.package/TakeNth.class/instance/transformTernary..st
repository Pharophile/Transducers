*Transducers-transforming
transformTernary: aReducingFunction
	
	| m count |
	m := n.	"copy reference to have less indirection in copying block"
	count := -1.
	^[:result :key :val | 
	(count := (count + 1) \\ m) = 0
		ifTrue: [aReducingFunction value: result value: key value: val]
		ifFalse: [result]]