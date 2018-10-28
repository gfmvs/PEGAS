//Initialize GUI
LOCAL pages_g1 IS GUI(240).
LOCAL gui_exit is false.
LOCAL gui_pegas is false.
set pages_g1:x to 490. //window start position
set pages_g1:y to 90.

//STYLE Setting
// set pages_g1:skin:toggle:on:textcolor to rgb(0.5,1,0).
// set pages_g1:skin:toggle:hover_on:textcolor to pages_g1:skin:toggle:on:textcolor.
// set pages_g1:skin:toggle:height to 20.
// set pages_g1:skin:toggle:padding:left to 32.
// set pages_g1:skin:toggle:bg to "gui/toggle_off.png".
// set pages_g1:skin:toggle:hover:bg to "gui/toggle_off_hover.png".
// set pages_g1:skin:toggle:on:bg to "gui/toggle_on.png".
// set pages_g1:skin:toggle:hover_on:bg to "gui/toggle_on_hover.png".
// set pages_g1:skin:toggle:active_on:bg to "gui/toggle_mid.png".
// set pages_g1:skin:toggle:active:bg to "gui/toggle_mid.png".

//Mission Setting Start
LOCAL label IS pages_g1:ADDLABEL("Mission Parameters").
SET label:STYLE:ALIGN TO "CENTER".
SET label:STYLE:HSTRETCH TO True. // Fill horizontally

LOCAL box1 IS pages_g1:ADDHLAYOUT().
	LOCAL MPL_1 IS box1:addlabel("Payload:").
	Set MPL_1:TOOLTIP to "Mass of the payload, that will be added to mass of each guided stage.".
	set MPL_1:style:width to 100.
	LOCAL MPL_V IS box1:ADDTEXTFIELD("").
	if vehicleinfo:HASKEY("vehicleInitialMass") {
		Set autoPayload to SHIP:MASS*1000 - vehicleinfo["vehicleInitialMass"].
		Set autoPayload to ROUND(autoPayload,0).
		Set MPL_V:TEXT to autoPayload:TOSTRING.
	}.
	set MPL_V:style:width to 115.
	set MPL_V:style:align to "right".
	set MPL_V:onconfirm to
	{ 
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set MPL_V:TEXT to "0".
	}.
	LOCAL MPL_2 IS box1:addlabel("Kg").
	
LOCAL box2 IS pages_g1:ADDHLAYOUT().
	LOCAL MPE_1 IS box2:addlabel("Periapsis:").
	Set MPE_1:TOOLTIP to "Desired periapsis above sea level.".
	set MPE_1:style:width to 100.
	LOCAL MPE_V IS box2:ADDTEXTFIELD("200").
	if vehicleinfo:HASKEY("suggestPeriapsis") {Set MPE_V:TEXT to vehicleinfo["suggestPeriapsis"]:TOSTRING.}.
	set MPE_V:style:width to 115.
	set MPE_V:style:align to "right".
	set MPE_V:onconfirm to
	{ 
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set MPE_V:TEXT to "0".
	}.
	LOCAL MPE_2 IS box2:addlabel("Km").
	
LOCAL box3 IS pages_g1:ADDHLAYOUT().
	LOCAL MAP_1 IS box3:addlabel("Apoapsis:").
	Set MAP_1:TOOLTIP to "Desired apoapsis above sea level.".
	set MAP_1:style:width to 100.
	LOCAL MAP_V IS box3:ADDTEXTFIELD("200").
	if vehicleinfo:HASKEY("suggestApoapsis") {Set MAP_V:TEXT to vehicleinfo["suggestApoapsis"]:TOSTRING.}.
	set MAP_V:style:width to 115.
	set MAP_V:style:align to "right".
	set MAP_V:onconfirm to
	{ 
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set MAP_V:TEXT to "0".
	}.
	LOCAL MAP_2 IS box3:addlabel("Km").

LOCAL box4 IS pages_g1:ADDHLAYOUT().
	LOCAL MAD_1 IS box4:addlabel("Altitude:").
	Set MAD_1:TOOLTIP to "<b>Optional</b>. Desired cutoff altitude above sea level. If not specified, will be set to periapsis.".
	set MAD_1:style:width to 100.
	LOCAL MAD_V IS box4:ADDTEXTFIELD("").
	if vehicleinfo:HASKEY("suggestAltitude") {Set MAD_V:TEXT to vehicleinfo["suggestAltitude"]:TOSTRING.}.
	set MAD_V:style:width to 115.
	set MAD_V:style:align to "right".
	set MAD_V:onconfirm to
	{
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set MAD_V:TEXT to "0".
	}.
	LOCAL MAD_2 IS box4:addlabel("Km").

LOCAL box5 IS pages_g1:ADDHLAYOUT().
	LOCAL INC_1 IS box5:addlabel("Inclination:").
	Set INC_1:TOOLTIP to "<b>Optional</b>. Inclination of the target orbit. When not given, will be set to launch site latitude (absolute).".
	set INC_1:style:width to 100.
	LOCAL INC_V IS box5:ADDTEXTFIELD("").
	set INC_V:style:width to 115.
	set INC_V:style:align to "right".
	set INC_V:onconfirm to
	{ 
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set INC_V:TEXT to "0".
		if val > 180 set INC_V:TEXT to "180".
	}.
	LOCAL INC_2 IS box5:addlabel("° ").

LOCAL box6 IS pages_g1:ADDHLAYOUT().
	LOCAL LAN_1 IS box6:addlabel("Long. of AN:").
	Set LAN_1:TOOLTIP to "<b>Optional</b>. Longitude of ascending node of the target orbit. When not given, will be calculated for an instantaneous launch.".
	set LAN_1:style:width to 100.
	LOCAL LAN_V IS box6:ADDTEXTFIELD("").
	set LAN_V:style:width to 115.
	set LAN_V:style:align to "right".
	set LAN_V:onconfirm to
	{ 
		parameter val.
		set val to val:tonumber(0).
		if val < 0 set LAN_V:TEXT to "0".
		if val > 360 set LAN_V:TEXT to "360".
	}.
	LOCAL LAN_2 IS box6:addlabel("° ").

LOCAL box7 IS pages_g1:ADDHLAYOUT().
	LOCAL DIR_1 IS box7:addlabel("Direction:").
	Set DIR_1:TOOLTIP to ("Direction of launch.").
	set DIR_1:style:width to 100.
	LOCAL DIR_V IS box7:addpopupmenu().
		LOCAL DIR_V1 IS DIR_V:ADDOPTION("Nearest").
		LOCAL DIR_V2 IS DIR_V:ADDOPTION("North").
		LOCAL DIR_V3 IS DIR_V:ADDOPTION("South").
	set DIR_V:style:width to 115.

LOCAL box8 IS pages_g1:ADDHLAYOUT().
//set box8:style:MARGIN:LEFT to 10.
//set box8:style:MARGIN:RIGHT to 10.
		LOCAL POS_1 IS box8:addlabel("Post Launch Script:").
		set POS_1:style:width to 125.
		LOCAL POS_V IS box8:ADDTEXTFIELD("").
		set POS_V:style:width to 110.
//Mission Setting End

//Advance Controls Start
LOCAL box9 IS pages_g1:ADDVLAYOUT().
set box9:style:MARGIN:TOP to 5.
	LOCAL mcontrols TO box9:ADDBUTTON("Show Advance Controls").
	set mcontrols:style:width to 240.
LOCAL adctrl TO pages_g1:ADDVBOX().
set adctrl:style:MARGIN:TOP to 5.
set adctrl:style:PADDING:TOP to 5.
set adctrl:style:PADDING:BOTTOM to 5.
set adctrl:style:PADDING:LEFT to 5.
	LOCAL adctrl_1 TO adctrl:ADDHLAYOUT().
		LOCAL LTA_1 IS adctrl_1:addlabel("Launch Time Advance:").
		Set LTA_1:TOOLTIP to "Launch time will be scheduled that many seconds before the launch site rotates directly under the target orbit.".
		set LTA_1:style:width to 180.
		LOCAL LTA_V IS adctrl_1:ADDTEXTFIELD("").
		Set LTA_V:TEXT to controls["launchTimeAdvance"]:TOSTRING.
		set LTA_V:style:width to 45.
		set LTA_V:style:align to "right".
		set LTA_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < 0 set LTA_V:TEXT to "0".
		}.
		
	LOCAL adctrl_2 TO adctrl:ADDHLAYOUT().
		LOCAL VAT_1 IS adctrl_2:addlabel("Vertical Ascent Time:").
		Set VAT_1:TOOLTIP to "After liftoff, vehicle will fly straight up for that many seconds before pitching over.".
		set VAT_1:style:width to 180.
		LOCAL VAT_V IS adctrl_2:ADDTEXTFIELD("").
		Set VAT_V:TEXT to controls["verticalAscentTime"]:TOSTRING.
		set VAT_V:style:width to 45.
		set VAT_V:style:align to "right".
		set VAT_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < 0 set VAT_V:TEXT to "0".
		}.
		
	LOCAL adctrl_3 TO adctrl:ADDHLAYOUT().
		LOCAL POA_1 IS adctrl_3:addlabel("Pitch Over Angle:").
		Set POA_1:TOOLTIP to "Vehicle will pitch over by that many degrees away from vertical.".
		set POA_1:style:width to 180.
		LOCAL POA_V IS adctrl_3:ADDTEXTFIELD("").
		Set POA_V:TEXT to controls["pitchOverAngle"]:TOSTRING.
		set POA_V:style:width to 45.
		set POA_V:style:align to "right".
		set POA_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < 0 set POA_V:TEXT to "0".
			if val > 15 set POA_V:TEXT to "15".
		}.
		
	LOCAL adctrl_4 TO adctrl:ADDHLAYOUT().
		LOCAL GPA_1 IS adctrl_4:addlabel("Guidance Phase Activation:").
		Set GPA_1:TOOLTIP to "The active guidance phase will be activated that many seconds after liftoff.".
		set GPA_1:style:width to 180.
		LOCAL GPA_V IS adctrl_4:ADDTEXTFIELD("").
		Set GPA_V:TEXT to controls["upfgActivation"]:TOSTRING.
		set GPA_V:style:width to 45.
		set GPA_V:style:align to "right".
		set GPA_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < 0 set GPA_V:TEXT to "0".
		}.
		
	LOCAL adctrl_5 TO adctrl:ADDHLAYOUT().
		LOCAL LAO_1 IS adctrl_5:addlabel("Launch Azimuth Override:").
		Set LAO_1:TOOLTIP to "Overrides automatic launch azimuth calculation, giving some basic optimization capability.".
		set LAO_1:style:width to 180.
		LOCAL LAO_V IS adctrl_5:ADDTEXTFIELD("").
		if controls:HASKEY("launchAzimuth"){Set LAO_V:TEXT to controls["launchAzimuth"]:TOSTRING.}.
		set LAO_V:style:width to 45.
		set LAO_V:style:align to "right".
		set LAO_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < -180 set LAO_V:TEXT to "-180".
			if val > 180 set LAO_V:TEXT to "180".
		}.
		
	LOCAL adctrl_6 TO adctrl:ADDHLAYOUT().
		LOCAL IRA_1 IS adctrl_6:addlabel("Initial Roll Angle:").
		Set IRA_1:TOOLTIP to "Angle to which the vehicle will roll during the initial pitchover maneuver.".
		set IRA_1:style:width to 180.
		LOCAL IRA_V IS adctrl_6:ADDTEXTFIELD("").
		if controls:HASKEY("initialRoll"){Set IRA_V:TEXT to controls["initialRoll"]:TOSTRING.}.
		set IRA_V:style:width to 45.
		set IRA_V:style:align to "right".
		set IRA_V:onconfirm to
		{ 
			parameter val.
			set val to val:tonumber(0).
			if val < 0 set IRA_V:TEXT to "0".
			if val > 360 set IRA_V:TEXT to "360".
		}.
	LOCAL adctrl_7 TO adctrl:ADDHLAYOUT().
		LOCAL AAA_1 IS adctrl_7:addcheckbox("Achieve orbit Before Apoapsis",false).
		Set AAA_1:TOOLTIP to "Achieve an elliptical orbit after apoapsis, useful to low TWR second stage launch vehicle.".
		set AAA_1:style:width to 225.
		set AAA_1:ONCLICK to
		{ 
			if AAA_1:PRESSED = TRUE {set AAA_1:TEXT to "Achieve orbit After Apoapsis".}.
			if AAA_1:PRESSED = FALSE {set AAA_1:TEXT to "Achieve orbit Before Apoapsis".}.
		}.
	LOCAL adctrl_8 TO adctrl:ADDHLAYOUT().
		LOCAL confirmADC TO adctrl_8:ADDBUTTON("Confirm Controls").
		set confirmADC:style:width to 115.
		LOCAL resetADC TO adctrl_8:ADDBUTTON("Reset").
		set resetADC:style:width to 110.
//Advance Controls End

//Main Button
LOCAL box10 TO pages_g1:ADDHLAYOUT().
set box10:style:MARGIN:TOP to 5.
	LOCAL mstart TO box10:ADDBUTTON("Start Mission").
	set mstart:style:width to 120.
	LOCAL cancel TO box10:ADDBUTTON("Cancel").
	set cancel:style:width to 115.

// Show the GUI.
adctrl:HIDE().
pages_g1:SHOW().

//Set Button Function Start
set mstart:ONCLICK TO ClickStart@.
set cancel:ONCLICK TO {pages_g1:HIDE().}.
set mcontrols:ONCLICK TO advcontrolsOpen@.
set confirmADC:ONCLICK TO confirmcontrol@.
set resetADC:ONCLICK TO resetcontrol@.

// wait until HASTARGET.
// box5:HIDE().
// box6:HIDE().

function advcontrolsOpen
{
	adctrl:SHOW().
	set mcontrols:ONCLICK TO advcontrolsCloed@.
	set mcontrols:TEXT TO "Hide Advance Controls".
}

function advcontrolsCloed
{
	adctrl:HIDE().
	set mcontrols:ONCLICK TO advcontrolsOpen@.
	set mcontrols:TEXT TO "Show Advance Controls".
}

function confirmcontrol
{
	if LTA_V:TEXT <> "" {SET controls["launchTimeAdvance"] TO LTA_V:TEXT:tonumber().}.
	if VAT_V:TEXT <> "" {SET controls["verticalAscentTime"] TO VAT_V:TEXT:tonumber().}.
	if POA_V:TEXT <> "" {SET controls["pitchOverAngle"] TO POA_V:TEXT:tonumber().}.
	if GPA_V:TEXT <> "" {SET controls["upfgActivation"] TO GPA_V:TEXT:tonumber().}.
	if LAO_V:TEXT <> "" {SET controls["launchAzimuth"] TO LAO_V:TEXT:tonumber().}
	else if controls:HASKEY("launchAzimuth") {REMOVE(controls["launchAzimuth"]).}.
	if IRA_V:TEXT <> "" {SET controls["initialRoll"] TO IRA_V:TEXT:tonumber().}
	else if controls:HASKEY("initialRoll") {REMOVE(controls["initialRoll"]).}.
	HUDTEXT("Vehicle Controls Setting has been Overridden", 5, 2, 15, red, false).
}

function resetcontrol
{
	if LTA_V:TEXT <> "" {SET LTA_V:TEXT TO controls["launchTimeAdvance"]:TOSTRING.}.
	if VAT_V:TEXT <> "" {SET VAT_V:TEXT TO controls["verticalAscentTime"]:TOSTRING.}.
	if POA_V:TEXT <> "" {SET POA_V:TEXT TO controls["pitchOverAngle"]:TOSTRING.}.
	if GPA_V:TEXT <> "" {SET GPA_V:TEXT TO controls["upfgActivation"]:TOSTRING.}.
	if LAO_V:TEXT <> "" {SET LAO_V:TEXT TO controls["launchAzimuth"]:TOSTRING.}.
	if IRA_V:TEXT <> "" {SET IRA_V:TEXT TO controls["initialRoll"]:TOSTRING.}.
}

function ClickStart 
{
	GLOBAL mission IS LEXICON
	(
		"periapsis", MPE_V:TEXT:tonumber(),
		"apoapsis", MAP_V:TEXT:tonumber(),
		"direction", DIR_V:VALUE
	).
	if MPL_V:TEXT <> "" {SET mission["payload"] TO MPL_V:TEXT:tonumber().}.
	if MAD_V:TEXT <> "" {SET mission["altitude"] TO MAD_V:TEXT:tonumber().}.
	if INC_V:TEXT <> "" {SET mission["inclination"] TO INC_V:TEXT:tonumber().}.
	if LAN_V:TEXT <> "" {SET mission["LAN"] TO LAN_V:TEXT:tonumber().}.
	if AAA_1:PRESSED = TRUE {SET mission["AOAAP"] TO TRUE.}
	else {SET mission["AOAAP"] TO FALSE.}.
	IF POS_V:TEXT = ""
	{
		SET postlaunch_action to FALSE.
		SET postlaunch_task to "none".
	}
	ELSE
	{
		SET postlaunch_action to TRUE.
		SET postlaunch_task to POS_V:TEXT.
	}
	HUDTEXT("Launch Countdown Started", 5, 2, 15, Green, false).
	set gui_pegas to true.
}
//Set Button Function End

//Final Action
ON AG9 {pages_g1:SHOW().}
wait until gui_pegas.
pages_g1:dispose().
RUN pegas.