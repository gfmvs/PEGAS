GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Falcon 9 S2",
		"massTotal", 114367,
		"massDry", 6829,
		"gLim", 2.5,
		"engines", LIST(LEXICON("isp", 347, "thrust", 1050000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "rcs",
			"ullageBurnDuration", 3,
			"postUllageBurn", 2
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -25, "type", "action", "message", "Release Clamp", "actionGroup", "10"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 134, "type", "action", "message", "MECO", "actionGroup", "1"),
	LEXICON("time", 137, "type", "stage", "message", "Stage I Separation"),
	LEXICON("time", 180, "type", "jettison", "message", "Cap and Shield Jettison", "massLost", 160)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 140,
	"verticalAscentTime", 19,
	"pitchOverAngle", 5.0,
	"upfgActivation", 140
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Falcon-9 Reusable (Ground Pad)",
	"vehicleInitialMass", 851050
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.