GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Stage II",
		"massTotal", 63125,
		"massDry", 28428,
		"engines", LIST(LEXICON("isp", 315.5, "thrust", 462746)),
		"staging", LEXICON
		(
			"jettison", TRUE,
			"waitBeforeJettison", 1,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "none"
		)
	),
	LEXICON
	(
		"name", "Centaur-T",
		"massTotal", 23928,
		"massDry", 3052,
		"engines", LIST(LEXICON("isp", 444, "thrust", 2*73400)),
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
	LEXICON("time", -0.7, "type", "stage", "message", "LR-87 ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 148, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 170, "type", "stage", "message", "PLF jettison")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 7,
	"pitchOverAngle", 9.5,
	"upfgActivation", 210
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Titan-IV 405B",
	"vehicleInitialMass", 937747
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
RUN pegas_gui.