module audio;

public class AudioInterface {
	AudioChannel channelLeftRearSurround;
	AudioChannel channelLeftSurround;
	AudioChannel channelLeft;
	AudioChannel channelCenter;
	AudioChannel channelRight;
	AudioChannel channelRightSurround;
	AudioChannel channelRightRearSurround;
	AudioChannel channelLeftTopFront;
	AudioChannel channelLeftTopRear;
	AudioChannel channelRightTopFront;
	AudioChannel channelRightTopRear;
	AudioChannel channelLowFrequencyEffect;

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
