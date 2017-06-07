*Transducers-printing
printOn: aStream
	
	self printFunction: predicate on: aStream.
	aStream
		space;
		nextPutAll: #remove