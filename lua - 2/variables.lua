--
-- VARIABLES & OPTIONS
--

-- The `apiHost` and `apiEndpoint` can be obtained by doing an authenticated API call
-- to `https://graph.api.smartthings.com/api/smartapps/endpoints`. See the README for more details.
apiHost     = "https://graph-na02-useast1.api.smartthings.com:443"
apiEndpoint = "/api/smartapps/installations/9d217afb-05ca-4933-8c25-ab81dcdce147"

-- Set `blink_led` to true to blink the blue onboard LED upon successful communication with SmartThings
-- This is useful for visual confirmation and testing, but I leave it off in production
-- The onboard LED is tied to pin D4 so you cannot use this pin for other things when enabled
blink_led = false

-- Set `poll_interval` in seconds to poll each sensor periodically as a _backup_ check. You really shouldn't need
-- to poll at all, but occasionally people have reported missed open/close events. This will not update SmartThings every
-- time, only if the state of the sensor is is different from the internal memory state.
-- Set this to 0 or null to never poll.
poll_interval = 60

-- `sensors` is a table of the sensor devices, their SmartThings device IDs and their corresponding pin on
-- the ESP8266 board. The pins are labeled with a `D` followed by a number. Only specify the numerical part as the `gpioPin`.
sensors = {}
sensors[1] = {
	name = "Breakfast Window Sensor",
	deviceId = "20d2ca2a-875f-4859-86cb-c28a39d2fe80",
	gpioPin = 1
}
sensors[2] = {
	name = "Kitchen Window Sensor",
	deviceId = "8e01c2f6-8bce-48c5-957a-abd79301f30f",
	gpioPin = 3
}
sensors[3] = {
	name = "Powder Room Window Sensor",
	deviceId = "03db9490-ab50-4d31-9018-5cb6ec5f013b",
	gpioPin = 5
}
sensors[4] = {
	name = "Egress Window Sensor",
	deviceId = "47ec86fa-e125-4622-97e8-5b32ef514337",
	gpioPin = 7
}

-- sensors[8] = {
-- 	name = "Breakfast Window Sensor",
-- 	deviceId = "20d2ca2a-875f-4859-86cb-c28a39d2fe80",
-- 	gpioPin = 8
-- }

-- `alarm` is the configuration to connect your alarm system's siren or strobe. SmartThings _Alarm_ capability supports
-- both siren and strobe states, so you can connect up to two wired devices to two pins on the NodeMCU ESP8266 board,
-- using a relay to switch a higher voltage device.
--
--  `deviceId`  - The SmartThings deviceId of your NodeMCU Connected Alarm device. Set this to `nil` to disable siren/strobe support.
--  `httpPort`  - The port used for your SmartThings hub to communicate with the built-in HTTP server on the NodeMCU
--  `sirenPin`  - The pin on the board connected to your siren relay. Set to `nil` to disable.
--  `strobePin` - The pin on the board connected to your strobe relay. Set to `nil` to disable.
alarm = {
  deviceId = nil,
  httpPort = 8100,
  sirenPin = 1,
  strobePin = nil
}
