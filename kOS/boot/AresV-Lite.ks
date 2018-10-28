GLOBAL vehicle IS LIST
(
	LEXICON(
		"name", "Core Stage",
		"massTotal", 1973698,
		"massDry", 423151,
		"engines", LIST(LEXICON("isp", 414, "thrust", 3560000*5)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Earth Departure Stage",
		"massTotal", 271323,
		"massDry", 26894,
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
	LEXICON("time", -1.5, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 135, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 240, "type", "jettison", "message", "PLF jettison", "massLost", 17844)
	//LEXICON("time", 220, "type", "stage", "message", "PLF jettison")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 24,	//	16
	"pitchOverAngle", 3.5,	//4
	"upfgActivation", 141
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Ares V Lite",
	"vehicleInitialMass", 2728107
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.