*Transducers-transforming
transformTernary: aReducingFunction
	
	| take copyBlock |
	copyBlock := predicate.	"copy block reference to have less indirection in copying block"
	take := true.
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(take and: [copyBlock value: key value: value])
				ifTrue: [aReducingFunction value: result value: key value: value]
				ifFalse:
					[take := false.
					Reduced signalWith: result]]]
		ifFalse:
			[[:result :key :value | 
			(take and: [copyBlock value: value])
				ifTrue: [aReducingFunction value: result value: key value: value]
				ifFalse:
					[take := false.
					Reduced signalWith: result]]]