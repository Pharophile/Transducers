*Transducers-Core-reducing
reduceValues: aReducingFunction init: value

	| function result |
	function := aReducingFunction nonCompleting.
	result := value.
	[result := function
		value: result
		value: self next] repeat.
	self error: 'This code should be unreachable.'