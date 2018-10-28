GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Core Stage",
		"massTotal", 1826118,
		"massDry", 275583,
		"gLim", 4.0,
		"engines", LIST(LEXICON("isp", 414, "thrust", 3560000*5)),
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
			"waitBeforeIgnition", 2,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 135, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 220, "type", "jettison", "message", "LES jettison", "massLost", 4588)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 18,
	"pitchOverAngle", 4,
	"upfgActivation", 140
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Ares IV",
	"vehicleInitialMass", 3304675
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.