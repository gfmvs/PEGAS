GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core URM1",
		"massTotal", 206717,
		"massDry", 74117,
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
		"massTotal", 63690,
		"massDry", 27692,
		"engines", LIST(LEXICON("isp", 359, "thrust", 294300)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "none"
		)
	),
	LEXICON
	(
		"name", "Breeze-M",
		"massTotal", 22512,
		"massDry", 7565,
		"engines", LIST(LEXICON("isp", 328.6, "thrust", 65756)),
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
	//LEXICON("time", 294, "type", "stage", "message", "MECO! First Stage Separation"),
	LEXICON("time", 302, "type", "stage", "message", "PLF Jettison", "massLost", 503)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 200,
	"verticalAscentTime", 26,
	"pitchOverAngle", 4,
	"upfgActivation", 217	//295
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Angara A5 with Breeze-M",
	"vehicleInitialMass", 782399
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.