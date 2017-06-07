*Transducers-Core-reducing
reduceValues: aReducingFunction init: value
	
	| function result |
	function := aReducingFunction nonCompleting.
	result := value.
	[| each |
	each := [self value]
		on: Reduced
		do: [^result].
	result := function value: result value: each] repeat.
	self error: 'This code should be unreachable.'