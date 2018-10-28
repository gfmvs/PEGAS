GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Core Stage",
		"massTotal", 1137509,
		"massDry", 153754,
		"gLim", 4.0,
		"engines", LIST(LEXICON("isp", 452, "thrust", 9116000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "ICPS",
		"massTotal", 60200,
		"massFuel", 32367,
		"engines", LIST(LEXICON("isp", 465.5, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -10, "type", "stage", "message", "Retract Crew Arm"),
	LEXICON("time", -7, "type", "stage", "message", "Disconnect Fuel Line"),
	LEXICON("time", -2, "type", "stage", "message", "Main Engine Ignition"),
	LEXICON("time", 0, "type", "stage", "message", "SRB Ignition And LIFTOFF"),
	LEXICON("time", 136, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 140, "type", "roll", "angle", 0),
	LEXICON("time", 220, "type", "action", "message", "LES jettison", "massLost", 3200, "actionGroup", "1")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 16,	//	16
	"pitchOverAngle", 4,	//4
	"upfgActivation", 141,
	"initialRoll", 90
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "SLS Block 1A with Orion",
	"vehicleInitialMass", 2618834
	"suggestPeriapsis", -100,
	"suggestApoapsis", 1800,
	"suggestAltitude", 400
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.