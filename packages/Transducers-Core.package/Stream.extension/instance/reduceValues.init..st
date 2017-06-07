*Transducers-Core-reducing
reduceValues: aReducingFunction init: value
	
	| function result |
	function := aReducingFunction nonCompleting.
	result := value.
	self do: [:each | result := function value: result value: each].
	^result