*Transducers-reducing
reduce: aReducingFunction init: value pass: aBoolean
	"Pass ReducedNotification iff pass is true."
	
	self subclassResponsibility