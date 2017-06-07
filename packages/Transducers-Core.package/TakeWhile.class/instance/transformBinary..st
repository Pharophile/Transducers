*Transducers-transforming
transformBinary: aReducingFunction
	
	| copyBlock |
	copyBlock := predicate.	"copy block reference to have less indirection in copying block"
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(copyBlock value: key value: value)
				ifTrue: [aReducingFunction value: result value: value]
				ifFalse: [Reduced signalWith: result]]]
		ifFalse:
			[[:result :value | 
			(copyBlock value: value)
				ifTrue: [aReducingFunction value: result value: value]
				ifFalse: [Reduced signalWith: result]]]