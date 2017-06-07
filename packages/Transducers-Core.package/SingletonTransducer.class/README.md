SingletonTransducer is an abstract superclass of stateless transducers. These transducers can be implemented as Singleton. Use #transducer to get their sole instance.

Class Instance Variables:
	transducer	<SingletonTransducer>	the sole instance of a stateless transducer

Subclasses must implement the following messages:
	transforming
		transform:
			Transform a reducing function to another reducing function.
