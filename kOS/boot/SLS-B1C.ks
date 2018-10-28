GLOBAL vehicle IS LIST
(
	LEXICON(
		"name", "Core Stage",
		"massTotal", 1287248,
		"massDry", 283494,
		"engines", LIST(LEXICON("isp", 452, "thrust", 9116000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Exploration Upper Stage",
		"massTotal", 184457,
		"massDry", 53658,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 440000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 141, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 200, "type", "jettison", "message", "PLF jettison", "massLost", 3950)
	//LEXICON("time", 220, "type", "stage", "message", "PLF jettison")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 21,	//	16
	"pitchOverAngle", 5,	//4
	"upfgActivation", 146
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "SLS Block 1C",
	"vehicleInitialMass", 3010908
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.