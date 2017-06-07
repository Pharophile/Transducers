A Replace transducer builds a reducing function that evaluates a given reducing function with the values stored in a lookup table treating each element as key.
If a key is absent, the original element is used instead.

Instance Variables
	lookup	<Dictionary | KeyedCollection>	a lookup table that responds to #at:ifAbsent:

