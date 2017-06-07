*Transducers-transforming
transformTernary: aReducingFunction
	
	| copyBlock |
	copyBlock := predicate.	"copy block reference to have less indirection in copying block"
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(copyBlock value: key value: value)
				ifTrue: [aReducingFunction value: result value: key value: value]
				ifFalse: [result]]]
		ifFalse:
			[[:result :key :value | 
			(copyBlock value: value)
				ifTrue: [aReducingFunction value: result value: key value: value]
				ifFalse: [result]]]