A Partition transducer builds a reducing function that splits the reducible in collections of n items each. The last collection may include fewer than n elements.
If offset is given and n = offset, the sub-collections may overlap or miss some elements of the source, i.e., the form not a proper partition of the source.

Instance Variables:
	n	<Integer>	size of each sub-collection
	offset	<Integer>	offset after which a new sub-collection is created

