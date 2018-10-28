GLOBAL vehicle IS LIST
(
	LEXICON(
		"name", "Core Stage",
		"massTotal", 1275328,
		"massDry", 291574,
		"engines", LIST(LEXICON("isp", 452, "thrust", 9116000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Earth Departure Stage",
		"massTotal", 177374,
		"massDry", 28581,
		"engines", LIST(LEXICON("isp", 448, "thrust", 3930000)),
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
	LEXICON("time", -2.5, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 141, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 200, "type", "jettison", "message", "PLF jettison", "massLost", 19182)
	//LEXICON("time", 220, "type", "stage", "message", "PLF jettison")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 25,	//	16
	"pitchOverAngle", 5,	//4
	"upfgActivation", 146
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "SLS Block 2B",
	"vehicleInitialMass", 3017988
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.