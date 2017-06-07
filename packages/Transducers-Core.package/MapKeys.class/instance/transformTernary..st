*Transducers-transforming
transformTernary: aReducingFunction
	
	| copyBlock |
	copyBlock := function.	"copy block reference to have less indirection in copying block"
	^function arity = 2
		ifTrue:
			[[:result :key :value | 
			aReducingFunction
				value: result
				value: (copyBlock value: key value: value)
				value: value]]
		ifFalse:
			[[:result :key :value | 
			aReducingFunction
				value: result
				value: (copyBlock value: value)
				value: value]]