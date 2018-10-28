GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Delta-III Thor",
		"massTotal", 126250, //+200.8
		"massDry", 30686, //+200.8
		"engines", LIST(LEXICON("isp", 302, "thrust", 1054200)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Delta-III Second Stage",
		"massTotal", 19652,
		"massDry", 2827,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
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
	LEXICON("time", 105, "type", "stage", "message", "Jettison Ground Ignite SRB "),
	LEXICON("time", 210, "type", "stage", "message", "Jettison Air-start SRB"),
	LEXICON("time", 220, "type", "jettison", "message", "PLF jettison", "massLost", 1503.8) //1704.6
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 160,
	"verticalAscentTime", 23,
	"pitchOverAngle", 4,
	"upfgActivation", 215
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Delta-III 8920",
	"vehicleInitialMass", 306616
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.