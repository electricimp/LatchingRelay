# LatchingRelay

This Squirrel class implements an interface for a latching relay. It requires two pins (one to toggle the on state, and one to toggle the off state).

**To add this library to your project, add** `#require "LatchingRelay.class.nut:1.0.0"` **to the top of your device code**

## Class Usage

## constructor(*onPin, offPin, [defaultState]*)

To instantiate a new LatchingRelay object, you must pass it two pins, which will be configured as ```DIGITAL_OUT```s. An optional third paraneter can be passed to set the default state (0 = off, 1 = on).

```squirrel
#require "LatchingRelay.class.nut:1.0"

// latching relay on an imp002 connected to pins 9 & A
relay <- LatchingRelay(hardware.pin9, hardware.pinA)
```

## relay.write(state)

The *write* method sets the relay to on (state = 1), or off (state = 0). Invalid states are ignored.

```squirrel
// Turn the relay on:
relay.write(1);
```

## relay.toggle()

The *toggle* method sets the relay to the opposite state.

```squirrel
// Toggle the relay
relay.toggle();
```

## relay.getState()

The *getState* method returns the current state of the relay.

```squirrel
// send the current state of the relay to the agent
agent.on("getState", function(data) {
  agent.send("getStateResponse", relay.getState());
});
```

## License

The LatchingRelay library is licensed under the [MIT License](./LICENSE).
