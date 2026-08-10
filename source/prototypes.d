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

import core.sync.mutex;
public class Events (K) {
	
	private Mutex mtx;
	private void[void delegate ()][K] listeners;

	public this () {
		mtx = new Mutex();
	}

	public Events!K on (K key, void delegate () cb) {
		synchronized (mtx) {
			if (key !in listeners) listeners[key] = new void [CB];
			listeners[key][cb] = null;
		}
		return this;
	}

}

public interface Mutexed {
	@property Mutex mtx ();
	alias mtx this;
}

public Mutex genMutex () {
	return new Mutex();
}
