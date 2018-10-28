GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Stage",
		"massTotal", 209433,
		"massDry", 39427,
		"engines", LIST(LEXICON("isp", 431.2, "thrust", 1359000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Second Stage (ECA)",
		"massTotal", 21309,
		"massDry", 6420,
		"engines", LIST(LEXICON("isp", 446, "thrust", 64800)),
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
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "Booster Ignition And LIFTOFF!"),
	LEXICON("time", 119, "type", "stage", "message", "SRB Jettison"),
	LEXICON("time", 170, "type", "jettison", "message", "PLF jettison", "massLost", 2681.8)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 180,
	"verticalAscentTime", 8,
	"pitchOverAngle", 9,
	"upfgActivation", 125
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Ariane-V ECA",
	"vehicleInitialMass", 775510,
	"suggestPeriapsis", 300,
	"suggestApoapsis", 300
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.