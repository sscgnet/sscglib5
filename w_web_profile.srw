HA$PBExportHeader$w_web_profile.srw
forward
global type w_web_profile from window
end type
type cb_3 from commandbutton within w_web_profile
end type
type cb_2 from commandbutton within w_web_profile
end type
type cb_1 from commandbutton within w_web_profile
end type
type st_1 from statictext within w_web_profile
end type
type sle_website from singlelineedit within w_web_profile
end type
type sle_password from singlelineedit within w_web_profile
end type
type st_6 from statictext within w_web_profile
end type
type sle_user from singlelineedit within w_web_profile
end type
type st_5 from statictext within w_web_profile
end type
type sle_database from singlelineedit within w_web_profile
end type
type st_4 from statictext within w_web_profile
end type
type sle_host from singlelineedit within w_web_profile
end type
type st_3 from statictext within w_web_profile
end type
end forward

global type w_web_profile from window
integer width = 1509
integer height = 1024
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
sle_website sle_website
sle_password sle_password
st_6 st_6
sle_user sle_user
st_5 st_5
sle_database sle_database
st_4 st_4
sle_host sle_host
st_3 st_3
end type
global w_web_profile w_web_profile

type variables
string ls_profile

end variables

event open;ls_profile = message.stringparm
this.title = "Web Database Profile for " + ls_profile
sle_host.text = ProfileString(gs_ini,ls_profile,"Host","")
sle_database.text = ProfileString(gs_ini,ls_profile,"Database","")
sle_user.text = ProfileString(gs_ini,ls_profile,"User","")
sle_password.text = ProfileString(gs_ini,ls_profile,"Password","")
sle_website.text = ProfileString(gs_ini,ls_profile,"Website","")

end event

on w_web_profile.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_website=create sle_website
this.sle_password=create sle_password
this.st_6=create st_6
this.sle_user=create sle_user
this.st_5=create st_5
this.sle_database=create sle_database
this.st_4=create st_4
this.sle_host=create sle_host
this.st_3=create st_3
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.sle_website,&
this.sle_password,&
this.st_6,&
this.sle_user,&
this.st_5,&
this.sle_database,&
this.st_4,&
this.sle_host,&
this.st_3}
end on

on w_web_profile.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_website)
destroy(this.sle_password)
destroy(this.st_6)
destroy(this.sle_user)
destroy(this.st_5)
destroy(this.sle_database)
destroy(this.st_4)
destroy(this.sle_host)
destroy(this.st_3)
end on

type cb_3 from commandbutton within w_web_profile
integer x = 1024
integer y = 192
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;Integer li
String ls_delete
IF Messagebox("Delete Profile","Do you with to delete this profile", Question!, YesNo!,2) = 1 THEN
	FOR li = 1 TO 20
		ls_delete = ProfileString(gs_ini,"DBProfiles",string(li),"")
		IF ls_delete = ls_profile THEN SetProfileString(gs_ini,"DBProfiles",string(li),"")	
	NEXT
	close(w_web_profile)
END IF

end event

type cb_2 from commandbutton within w_web_profile
integer x = 1024
integer y = 64
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rename"
end type

event clicked;string ls_new
integer li
openwithparm(w_ask,"New Profile Name")
ls_new = message.stringparm
IF ls_new <> "" THEN
	SetProfileString(gs_ini,ls_new,"Host",sle_host.text)
	SetProfileString(gs_ini,ls_new,"Database",sle_database.text)
	SetProfileString(gs_ini,ls_new,"User",sle_user.text)
	SetProfileString(gs_ini,ls_new,"Password",sle_password.text)
	SetProfileString(gs_ini,ls_new,"Website",sle_website.text)
	FOR li = 1 TO 20
		IF ProfileString(gs_ini,"DBProfiles",string(li),"") = ls_profile THEN SetProfileString(gs_ini,"DBProfiles",string(li),ls_new)	
	NEXT
	SetProfileString(gs_ini,"FTP-" + ls_new,"Host",ProfileString(gs_ini,"FTP-" + ls_profile,"Host",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"User",ProfileString(gs_ini,"FTP-" + ls_profile,"User",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"Remote",ProfileString(gs_ini,"FTP-" + ls_profile,"Remote",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"password",ProfileString(gs_ini,"FTP-" + ls_profile,"Password",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"ASP",ProfileString(gs_ini,"FTP-" + ls_profile,"ASP",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"SRD",ProfileString(gs_ini,"FTP-" + ls_profile,"SRD",""))
	SetProfileString(gs_ini,"FTP-" + ls_new,"PBL",ProfileString(gs_ini,"FTP-" + ls_profile,"PBL",""))
	close(w_web_profile)
END IF
end event

type cb_1 from commandbutton within w_web_profile
integer x = 475
integer y = 704
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;close(w_web_profile)
end event

type st_1 from statictext within w_web_profile
integer x = 73
integer y = 512
integer width = 293
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Website:"
boolean focusrectangle = false
end type

type sle_website from singlelineedit within w_web_profile
integer x = 402
integer y = 512
integer width = 987
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;SetProfileString(gs_ini,ls_profile,"WebSite",this.text)
end event

type sle_password from singlelineedit within w_web_profile
integer x = 402
integer y = 400
integer width = 571
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;SetProfileString(gs_ini,ls_profile,"Password",this.text)
end event

type st_6 from statictext within w_web_profile
integer x = 73
integer y = 400
integer width = 293
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
boolean focusrectangle = false
end type

type sle_user from singlelineedit within w_web_profile
integer x = 402
integer y = 288
integer width = 571
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;SetProfileString(gs_ini,ls_profile,"User",this.text)
end event

type st_5 from statictext within w_web_profile
integer x = 73
integer y = 288
integer width = 283
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "User:"
boolean focusrectangle = false
end type

type sle_database from singlelineedit within w_web_profile
integer x = 402
integer y = 176
integer width = 571
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;SetProfileString(gs_ini,ls_profile,"Database",this.text)
end event

type st_4 from statictext within w_web_profile
integer x = 73
integer y = 176
integer width = 283
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Database:"
boolean focusrectangle = false
end type

type sle_host from singlelineedit within w_web_profile
integer x = 402
integer y = 60
integer width = 571
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;SetProfileString(gs_ini,ls_profile,"Host",this.text)
end event

type st_3 from statictext within w_web_profile
integer x = 73
integer y = 60
integer width = 251
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Host:"
boolean focusrectangle = false
end type

