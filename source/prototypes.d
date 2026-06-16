module prototypes;

/// This can be `null`
public alias Optional (T) = T;

public class Result (T, E : Error) {
	public T data = null;
	public E error = null;

	const pure @safe this (T data) {
		this.data = data;
	}

	const pure @safe this (E error) {
		this.error = error;
	}
}
