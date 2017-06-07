A Reduced signal is sent if a reduction is finished early. The parameter has to be set to the result of the reduction, i.e., ReducedNotification raiseWith: #result.

Signaling the end of a reduction enables processing a finite subset of a potentially infinite reducible. For example, to get an array of the first five prime numbers from a reducible that generates all primes:
	(#copyWith: init: #()) <~ 5 take <~ Naturals primes