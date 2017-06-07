*Transducers-Core-data flow
accumulator
	
	^[:col :each | 
	col
		add: each;
		yourself]