GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Vega Stage II",
		"massTotal", 39832,
		"massDry", 15832,
		"engines", LIST(LEXICON("isp", 287.5, "thrust", 871000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "none"
		)
	),
	LEXICON
	(
		"name", "Vega Stage III",
		"massTotal", 12982,
		"massDry", 2482,
		"engines", LIST(LEXICON("isp", 296, "thrust", 110000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "none"
		)
	),
	LEXICON
	(
		"name", "Vega Stage IV",
		"massTotal", 732,
		"massDry", 172,
		"engines", LIST(LEXICON("isp", 315.5, "thrust", 24000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 1,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", 0, "type", "stage", "message", "Ignition And LIFTOFF!"),
	LEXICON("time", 195, "type", "jettison", "message", "LES jettison", "massLost", 400)
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 120,
	"verticalAscentTime", 12,	//	7 seconds work well for 5t payload, 8 good for 15t
	"pitchOverAngle", 9.0,
	"upfgActivation", 107
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "Vega",
	"vehicleInitialMass", 135272
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
RUN pegas_gui.