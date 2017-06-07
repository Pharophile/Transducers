*Transducers-transforming
transformBinary: aReducingFunction
	
	| copyBlock |
	copyBlock := function.	"copy block reference to have less indirection in copying block"
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(copyBlock value: key value: value)
				ifNotNil: [:notNil | aReducingFunction value: result value: notNil]
				ifNil: [result]]]
		ifFalse:
			[[:result :value | 
			(copyBlock value: value)
				ifNotNil: [:notNil | aReducingFunction value: result value: notNil]
				ifNil: [result]]]