GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Proton Second Stage",
		"massTotal", 211946,
		"massDry", 63457,
		"engines", LIST(LEXICON("isp", 327, "thrust", 582000*4)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Proton Third Stage",
		"massTotal", 48172,
		"massDry", 3801,
		"engines", LIST(LEXICON("isp", 294, "thrust", 582000),LEXICON("isp", 320, "thrust", 30900)),
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
	LEXICON("time", 0, "type", "stage", "message", "Ignition And LIFTOFF"),
	LEXICON("time", 121.5, "type", "stage", "message", "First Stage Separation"),
	LEXICON("time", 123, "type", "stage", "message", "Second Stage Ignition"),
	LEXICON("time", 180, "type", "jettison", "message", "PLF jettison", "massLost", 4015)
	
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 13,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 6,
	"upfgActivation", 130
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Proton-M",
	"vehicleInitialMass", 650629
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.