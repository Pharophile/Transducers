*Transducers-transforming
transformBinary: aReducingFunction
	
	| transformed values isReduced previous copyBlock isFirst |
	copyBlock := function.	"copy block reference to have less indirection in copying block"
	isFirst := true.
	isReduced := false.
	values := OrderedCollection new.
	transformed := copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			| current return |
			current := copyBlock value: key value: value.
			isFirst
				ifTrue:
					[isFirst := false.
					previous := current].
			previous = current
				ifTrue: [return := result]
				ifFalse:
					[[return := aReducingFunction value: result value: values]
						on: Reduced
						do:
							[:reduced | 
							isReduced := true.
							reduced pass].
					previous := current.
					values := OrderedCollection new].
			values add: value.
			return]]
		ifFalse:
			[[:result :value | 
			| current return |
			current := copyBlock value: value.
			isFirst
				ifTrue:
					[isFirst := false.
					previous := current].
			previous = current
				ifTrue: [return := result]
				ifFalse:
					[[return := aReducingFunction value: result value: values]
						on: Reduced
						do:
							[:reduced | 
							isReduced := true.
							reduced pass].
					previous := current.
					values := OrderedCollection new].
			values add: value.
			return]].
	^transformed
		completing:
			[:result | 
			(isReduced or: [values isEmpty])
				ifTrue: [result]
				ifFalse:
					[[aReducingFunction value: result value: values]
						on: Reduced
						do: [:reduced | reduced parameter]]]