GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Stage Two",
		"massTotal", 174003,
		"massDry", 39184,
		"gLim", 1.5,
		"engines", LIST(LEXICON("isp", 448, "thrust", 1310000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 0.5,
			"ignition", TRUE,
			"waitBeforeIgnition", 2.5,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10, "type", "stage", "message", "Retract Crew Arm"),
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", 0, "type", "stage", "message", "ignition And LIFTOFF"),
	LEXICON("time", 10, "type", "roll", "angle", 0),
	LEXICON("time", 155, "type", "action", "message", "LES jettison", "massLost", 3200, "actionGroup", "1")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 7,
	"pitchOverAngle", 6,
	"upfgActivation", 130
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: Ares I Orion!".