module audio;

import prototypes;

public class AudioInterface {
	Optional!AudioChannel channelLeftRearSurround;
	Optional!AudioChannel channelLeftSurround;
	Optional!AudioChannel channelLeft;
	Optional!AudioChannel channelCenter;
	Optional!AudioChannel channelRight;
	Optional!AudioChannel channelRightSurround;
	Optional!AudioChannel channelRightRearSurround;
	Optional!AudioChannel channelLeftTopFront;
	Optional!AudioChannel channelLeftTopRear;
	Optional!AudioChannel channelRightTopFront;
	Optional!AudioChannel channelRightTopRear;
	Optional!AudioChannel channelLowFrequencyEffect;

	AudioInterface[] ingress;
	AudioInterface[] egress;
}

public class AudioChannel {
	AudioInterface parentInterface;
	
	float[256] buffer;
	
	AudioProducer producer;
	AudioConsumer consumer;
}

public class AudioProducer {}
public class AudioConsumer {}
