*Transducers-printing
printOn: aStream
	
	self printFunction: function on: aStream.
	aStream
		space;
		nextPutAll: #keep