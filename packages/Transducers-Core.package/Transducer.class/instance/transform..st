*Transducers-transforming
transform: aReducingFunction
	"The reducing function may be binary or ternary, e.g., #+ or [:result :key :val | ... ]."
	
	| transformed |
	transformed := aReducingFunction arity = 2
		ifTrue: [self transformBinary: aReducingFunction nonCompleting]
		ifFalse: [self transformTernary: aReducingFunction nonCompleting].
	^transformed completing: [:result | aReducingFunction complete: result]