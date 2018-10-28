GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Stage Two",
		"massTotal", 956304,
		"massDry", 188705,
		"gLim", 5.0,
		"engines", LIST(LEXICON("isp", 313, "thrust", 8990000*2)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Stage Two",
		"massTotal", 151263,
		"massDry", 16445,
		"engines", LIST(LEXICON("isp", 448, "thrust", 1310000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2.5,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 20, "type", "throttle", "throttle", 0.8),
	LEXICON("time", 60, "type", "throttle", "throttle", 1.0),
	LEXICON("time", 180, "type", "jettison", "message", "LES jettison", "massLost", 4588)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 160,
	"verticalAscentTime", 9,
	"pitchOverAngle", 7,
	"upfgActivation", 100
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Ares II",
	"vehicleInitialMass", 961304
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.