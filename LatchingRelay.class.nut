class LatchingRelay {
    _on = null;
    _off = null;

    _state = null;

    constructor(onPin, offPin, initialState = 0) {
        _on = onPin;
        _off = offPin;

        _on.configure(DIGITAL_OUT, 0);
        _off.configure(DIGITAL_OUT, 0);

        this.write(initialState);
    }

    function write(state) {
        _state = state;
        if (_state) {
            _on.write(1);
            imp.wakeup(0.1, function() { _on.write(0); }.bindenv(this));
        } else {
            _off.write(1);
            imp.wakeup(0.1, function() { _off.write(0); }.bindenv(this));
        }
    }

    function toggle() {
        this.write(1 - _state);
    }

    function getState() {
        return _state;
    }
}
