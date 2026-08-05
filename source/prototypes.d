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

/// The data un-Shrödinger-inator
public class Live (T) {
	private T stored = T.init;

	public void observe (void delegate (ref T data)) {}
	public void update (void delegate (ref T data)) {}
	public void replace (T data) {}
}

public class Events (alias CB, K) if(is(CB == delegate)) {
	import core.sync.mutex;
	
	private Mutex mtx = new Mutex();
	private void[CB][K] listeners = new void[CB][K];

	public this () {}

	public Events!CB on (K key, CB cb) {
		synchronized (mtx) {
			if (key !in listeners) listeners[key] = new void [CB];
			
		}
		return this;
	}
}
