GLOBAL vehicle IS LIST
(
	// LEXICON(
		// "name", "Core Booster",
		// "massTotal", 265519,
		// "massDry", 61519,
		// "gLim", 6.0,
		// "engines", LIST(LEXICON("isp", 414, "thrust", 3560000)),
		// "staging", LEXICON
		// (
			// "jettison", FALSE,
			// "ignition", FALSE
		// )
	// ),
	LEXICON
	(
		"name", "DCSS-5m",
		"massTotal", 34118.2,
		"massDry", 6898.2,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			//"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "rcs",
			"ullageBurnDuration", 7,
			"postUllageBurn", 5
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "Booster Ignition And LIFTOFF!"),
	LEXICON("time", 90, "type", "stage", "message", "SRB Jettison"),
	LEXICON("time", 232, "type", "stage", "message", "Core Booster Jettison"),
	LEXICON("time", 275, "type", "jettison", "message", "PLF jettison", "massLost", 3008.2)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 240,
	"verticalAscentTime", 10,
	"pitchOverAngle", 5,
	"upfgActivation", 237
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Delta-IV Medium+5.2",
	"vehicleInitialMass", 338411.2, //-5444
	"suggestPeriapsis", 185,
	"suggestApoapsis", 300,
	"suggestAltitude", 300
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.