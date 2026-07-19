module prototypes;

/// This can be `null`
public alias Optional (T) = T;

public class Result (T, E : Error = Error) {
	public T data = null;
	public E error = null;

	pure @safe this (T data) {
		this.data = data;
	}

	pure @safe this (E error) {
		this.error = error;
	}
}
