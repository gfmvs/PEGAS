GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core URM1",
		"massTotal", 183904,
		"massDry", 51304,
		"engines", LIST(LEXICON("isp", 337.5, "thrust", 2085000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "URM2",
		"massTotal", 40876,
		"massDry", 4879,
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
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 44, "type", "throttle", "throttle", 0.5),
	LEXICON("time", 211, "type", "stage", "message", "Booster Separation"),
	LEXICON("time", 212, "type", "throttle", "throttle", 1),
	LEXICON("time", 302, "type", "stage", "message", "PLF Jettison", "massLost", 503)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 185,
	"verticalAscentTime", 26,
	"pitchOverAngle", 5,
	"upfgActivation", 218
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Angara A5",
	"vehicleInitialMass", 759586
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.