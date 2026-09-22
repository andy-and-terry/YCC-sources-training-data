// The adapter pattern wraps an incompatible type behind the interface
// callers expect, without modifying either side.
trait PowerSource {
    fn voltage(&self) -> u32;
}

struct EuropeanSocket;

impl EuropeanSocket {
    fn output_voltage(&self) -> u32 {
        230
    }
}

struct UsAppliance;

impl UsAppliance {
    fn plug_in(&self, source: &dyn PowerSource) {
        println!("appliance receives {}V", source.voltage());
        if source.voltage() > 120 {
            println!("warning: voltage too high, appliance may be damaged");
        } else {
            println!("appliance running normally");
        }
    }
}

// The adapter implements the trait the client expects, translating
// calls to the adaptee's incompatible interface underneath.
struct EuroToUsAdapter {
    socket: EuropeanSocket,
}

impl PowerSource for EuroToUsAdapter {
    fn voltage(&self) -> u32 {
        // a real step-down transformer would do this conversion
        self.socket.output_voltage() / 2
    }
}

struct DirectUsSocket;

impl PowerSource for DirectUsSocket {
    fn voltage(&self) -> u32 {
        120
    }
}

fn main() {
    let appliance = UsAppliance;

    let us_socket = DirectUsSocket;
    appliance.plug_in(&us_socket);

    let adapter = EuroToUsAdapter { socket: EuropeanSocket };
    appliance.plug_in(&adapter);
}
