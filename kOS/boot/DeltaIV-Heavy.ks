GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Booster",
		"massTotal", 265519,		//	Short-1003
		"massDry", 61519,		//	Short-1003
		"engines", LIST(LEXICON("isp", 414, "thrust", 3560000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "DCSS 5m",
		"massTotal", 34118.2,
		"massDry", 6898.2,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "rcs",
			"ullageBurnDuration", 8,
			"postUllageBurn", 7
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10.0, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -1.5, "type", "stage", "message", "Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 44, "type", "throttle", "throttle", 0.55),
	LEXICON("time", 229.5, "type", "stage", "message", "Booster Separation"),
	LEXICON("time", 230, "type", "throttle", "throttle", 1),
	LEXICON("time", 340, "type", "stage", "message", "PLF Jettison", "massLost", 3008.2)	//Middle+1003
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 360,
	"verticalAscentTime", 24,
	"pitchOverAngle", 3.8,
	"upfgActivation", 285
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Delta-IV Heavy",
	"vehicleInitialMass", 742123.2 //-5444
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.