GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Booster",
		"massTotal", 255993,
		"massDry", 53976,
		"gLim", 4.5,
		"engines", LIST(LEXICON("isp", 414, "thrust", 3560000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "DCSS-4m",
		"massTotal", 26776,
		"massDry", 5457,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 3,
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
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 275, "type", "jettison", "message", "PLF jettison", "massLost", 2206.8)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 240,
	"verticalAscentTime", 30,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 6,
	"upfgActivation", 200
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Delta-IV Medium",
	"vehicleInitialMass", 262976
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.