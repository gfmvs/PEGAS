GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Stage Two",
		"massTotal", 151263,
		"massDry", 16445,
		"gLim", 2.5,
		"engines", LIST(LEXICON("isp", 448, "thrust", 1310000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 2.5,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", 0, "type", "stage", "message", "ignition And LIFTOFF"),
	LEXICON("time", 10, "type", "roll", "angle", 0),
	LEXICON("time", 130, "type", "stage", "message", "First Stage Separation"),
	LEXICON("time", 160, "type", "jettison", "message", "LES jettison", "massLost", 4588)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 7,
	"pitchOverAngle", 6,
	"upfgActivation", 136
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Ares I",
	"vehicleInitialMass", 847188
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.