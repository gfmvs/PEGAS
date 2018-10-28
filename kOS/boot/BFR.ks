GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "BFR Stage I",
		"massTotal", 5398330,
		"massDry", 1936212,
		"gLim", 3.5,
		"shutdownRequired", TRUE,
		"engines", LIST(LEXICON("isp", 361, "thrust", 31*3050000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Big Falcon Ship",
		"massTotal", 1366918,
		"massDry", 84652,
		"gLim", 2.5,
		"engines", LIST(LEXICON("isp", 383, "thrust", 4*3050000)),
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
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 140,
	"verticalAscentTime", 10,
	"pitchOverAngle", 9,
	"upfgActivation", 95
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Big Falcon Rocket",
	"vehicleInitialMass", 5402330
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.