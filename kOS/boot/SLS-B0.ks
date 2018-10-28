GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Stage",
		"massTotal", 1100071,
		"massDry", 116316,
		"gLim", 3.5,
		"engines", LIST(LEXICON("isp", 452, "thrust", 9116000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 135, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 220, "type", "jettison", "message", "PLF jettison", "massLost", 23236)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 16,	//	16
	"pitchOverAngle", 4,	//4
	"upfgActivation", 140
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "SLS Block 0",
	"vehicleInitialMass", 2578628
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.