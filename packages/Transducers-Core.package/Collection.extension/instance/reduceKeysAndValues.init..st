*Transducers-Core-reducing
reduceKeysAndValues: aReducingFunction init: value
	
	| function result |
	function := aReducingFunction nonCompleting.
	result := value.
	self
		keysAndValuesDo:
			[:key :each | result := function value: result value: key value: each].
	^result