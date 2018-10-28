GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Booster",
		"massTotal", 99229,
		"massDry", 25119,
		"engines", LIST(LEXICON("isp", 320.6, "thrust", 990180)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Upper Satge",
		"massTotal", 21010,
		"massDry", 1653,
		"gLim", 4.0,
		"engines", LIST(LEXICON("isp", 359, "thrust", 294300)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -5, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 90, "type", "throttle", "throttle", 0.85),
	LEXICON("time", 105, "type", "throttle", "throttle", 0.75),
	LEXICON("time", 120, "type", "throttle", "throttle", 0.65),
	LEXICON("time", 135, "type", "throttle", "throttle", 0.55),
	LEXICON("time", 156, "type", "stage", "message", "booster separation"),
	LEXICON("time", 175, "type", "stage", "message", "LES jettison", "massLost", 970)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 120,
	"verticalAscentTime", 13,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 10.0,
	"upfgActivation", 161
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Soyuz-2.1b",
	"vehicleInitialMass", 285035
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
RUN pegas_gui.