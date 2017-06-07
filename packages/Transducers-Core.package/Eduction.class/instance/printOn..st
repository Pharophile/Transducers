*Transducers-printing
printOn: aStream
	
	transducer printOn: aStream.
	aStream
		space;
		nextPutAll: #<~;
		space;
		nextPut: $(.
	reducible printOn: aStream.
	aStream nextPut: $)