GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Falcon-9 Stage II",
		"massTotal", 114895,
		"massDry", 7357,
		"gLim", 2.0,
		"engines", LIST(LEXICON("isp", 347, "thrust", 1050000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "rcs",
			"ullageBurnDuration", 3,
			"postUllageBurn", 2
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -15, "type", "action", "message", "Release Clamp", "actionGroup", "10"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 30, "type", "action", "message", "Core Throttle to 90%", "actionGroup", "2"),
	LEXICON("time", 50, "type", "action", "message", "Core Throttle to 80%", "actionGroup", "2"),
	LEXICON("time", 90, "type", "throttle", "throttle", 0.8),
	LEXICON("time", 120, "type", "throttle", "throttle", 0.6),
	LEXICON("time", 153, "type", "action", "message", "Booster Engine Cut-Off", "actionGroup", "1"),
	LEXICON("time", 154, "type", "stage", "message", "Booster Separation"),
	LEXICON("time", 155, "type", "throttle", "throttle", 1.0),
	LEXICON("time", 193, "type", "action", "message", "Core Engine Cut-Off", "actionGroup", "4"),
	LEXICON("time", 194, "type", "stage", "message", "Stage I Separation"),
	LEXICON("time", 209, "type", "stage", "message", "PLF jettison", "massLost", 3410.6)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 140,
	"verticalAscentTime", 10,
	"pitchOverAngle", 9.0,
	"upfgActivation", 199
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Falcon-Heavy (Full Recover)",
	"vehicleInitialMass", 1719079,
	"suggestPeriapsis", 180,
	"suggestApoapsis", 300,
	"suggestAltitude", 300
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.