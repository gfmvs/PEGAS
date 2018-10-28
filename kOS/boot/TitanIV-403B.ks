GLOBAL vehicle IS LIST
(
	LEXICON
	(
		"name", "Stage I",
		"massTotal", 215727,
		"massDry", 60721,
		"engines", LIST(LEXICON("isp", 300, "thrust", 2313100)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", FALSE
		)
	),
	LEXICON
	(
		"name", "Stage II",
		"massTotal", 52775,
		"massDry", 18077,
		"engines", LIST(LEXICON("isp", 315.5, "thrust", 462746)),
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
	LEXICON("time", -0.7, "type", "stage", "message", "LR-87 ignition"),
	LEXICON("time", 0, "type", "stage", "message", "LIFTOFF"),
	LEXICON("time", 148, "type", "stage", "message", "SRB jettison"),
	LEXICON("time", 153, "type", "stage", "message", "PLF jettison")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 150,
	"verticalAscentTime", 7,
	"pitchOverAngle", 10,
	"upfgActivation", 159
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Titan-IV 403B",
	"vehicleInitialMass", 927343
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
RUN pegas_gui.