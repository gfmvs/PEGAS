GLOBAL vehicle IS LIST
(
	LEXICON(
		//	This is a sustainer-type stage. It ignites on the pad, but UPFG takes control over it mid-flight.
		//	Therefore, no ignition or separation happens, and the actual mass of the stage at activation is
		//	inferred automatically.
		"name", "Second Stage",
		"massTotal", 105847,
		"massDry", 13626,
		"gLim", 3.0,
		"engines", LIST(LEXICON("isp", 298, "thrust", 847000)),
		"staging", LEXICON
		(
			"jettison", FALSE,
			"ignition", TRUE,
			"waitBeforeIgnition", 2,
			"ullage", "none"
		)
	)
).
GLOBAL sequence IS LIST
(
	LEXICON("time", -0.8, "type", "stage", "message", "点火"),
	LEXICON("time", 0, "type", "stage", "message", "起飞"),
	LEXICON("time", 149, "type", "stage", "message", "助推器分离"),
	LEXICON("time", 158, "type", "stage", "message", "一级分离"),
	LEXICON("time", 180, "type", "action", "message", "逃逸塔分离，整流罩分离", "massLost", 2213, "actionGroup", "1")
).
GLOBAL controls IS LEXICON
(
	"launchTimeAdvance", 120,
	"verticalAscentTime", 25,
	"pitchOverAngle", 5,
	"upfgActivation", 159
).
GLOBAL vehicleinfo IS LEXICON
(
	"launchVehicleName", "长征-2F",
	"vehicleInitialMass", 506512
).
SET STEERINGMANAGER:ROLLTS TO 10.
SWITCH TO 0.
CLEARSCREEN.
PRINT "Loaded boot file: " + vehicleinfo["launchVehicleName"] + "!".
SET CORE:PART:TAG TO "Ascent Control".
RUN pegas_gui.