GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Delta-XLT",
		"massTotal", 110212,
		"massDry", 14090,
		"engines", LIST(LEXICON("isp", 302, "thrust", 1054200)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Delta-K",
		"massTotal", 8060,
		"massDry", 2068,
		"engines", LIST(LEXICON("isp", 319, "thrust", 43400)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "rcs",
			"ullageBurnDuration", 5,
			"postUllageBurn", 2
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 79, "type", "stage", "message", "SRB Jettison"),
	LEXICON("time", 280, "type", "jettison", "message", "PLF jettison", "massLost", 1003)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 11,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 5,
	"upfgActivation", 150
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Delta-II 7420",
	"vehicleInitialMass", 186377
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.