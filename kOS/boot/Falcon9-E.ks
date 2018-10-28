GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Falcon-9 Stage I",
		"massTotal", 547212,
		"massDry", 136299,
		"gLim", 3.5,
		"engines", LIST(LEXICON("isp", 320, "thrust", 9*914000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Falcon-9 Stage II",
		"massTotal", 114895,
		"massDry", 7357,
		"gLim", 2.5,
		"engines", LIST(LEXICON("isp", 347, "thrust", 1050000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "rcs",
			"ullageBurnDuration", 5,
			"postUllageBurn", 2
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -25, "type", "action", "message", "Release Clamp", "actionGroup", "10"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 180, "type", "stage", "message", "PLF jettison", "massLost", 3410.6)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 140,
	"verticalAscentTime", 16,
	"pitchOverAngle", 5.0,
	"upfgActivation", 150
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Falcon-9 Expendable",
	"vehicleInitialMass", 847212
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.