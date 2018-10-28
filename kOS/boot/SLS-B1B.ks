GLOBAL vehicle IS LIST
(
	// LEXICON(
		// "name", "Core Stage",
		// "massTotal", 1249549,
		// "massDry", 265795,
		// "engines", LIST(LEXICON("isp", 452, "thrust", 2279000*4)),
		// "staging", LEXICON
		// (
			// "jettison", FALSE,
			// "ignition", FALSE
		// )
	// ),
	LEXICON
	(
		"name", "Exploration Upper Stage",
		"massTotal", 151321,
		"massDry", 20319,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000*4)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			//"waitBeforeJettison", 1,
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
	LEXICON("time", 136, "type", "stage", "message", "SRB jettison"),
	//LEXICON("time", 210, "type", "jettison", "message", "PLF jettison", "massLost", 19182)
	LEXICON("time", 210, "type", "stage", "message", "PLF jettison"),
	LEXICON("time", 478, "type", "stage", "message", "Core Stage Separation")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 24,	//	16
	"pitchOverAngle", 2,	//4
	"upfgActivation", 479
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "SLS Block 1B",
	"vehicleInitialMass", 2728107,
	"suggestPeriapsis", 200,
	"suggestApoapsis", 600,
	"suggestAltitude", 300
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.