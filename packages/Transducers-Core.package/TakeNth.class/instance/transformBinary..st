*Transducers-transforming
transformBinary: aReducingFunction
	
	| m count |
	m := n.	"copy reference to have less indirection in copying block"
	count := -1.
	^[:result :val | 
	(count := (count + 1) \\ m) = 0
		ifTrue: [aReducingFunction value: result value: val]
		ifFalse: [result]]