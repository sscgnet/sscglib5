HA$PBExportHeader$u_multiple_chkbx.sru
forward
global type u_multiple_chkbx from userobject
end type
type cbx_48 from checkbox within u_multiple_chkbx
end type
type cbx_47 from checkbox within u_multiple_chkbx
end type
type cbx_46 from checkbox within u_multiple_chkbx
end type
type cbx_45 from checkbox within u_multiple_chkbx
end type
type cbx_44 from checkbox within u_multiple_chkbx
end type
type cbx_43 from checkbox within u_multiple_chkbx
end type
type cbx_42 from checkbox within u_multiple_chkbx
end type
type cbx_41 from checkbox within u_multiple_chkbx
end type
type cbx_40 from checkbox within u_multiple_chkbx
end type
type cbx_39 from checkbox within u_multiple_chkbx
end type
type cbx_38 from checkbox within u_multiple_chkbx
end type
type cbx_37 from checkbox within u_multiple_chkbx
end type
type cbx_36 from checkbox within u_multiple_chkbx
end type
type cbx_35 from checkbox within u_multiple_chkbx
end type
type cbx_34 from checkbox within u_multiple_chkbx
end type
type cbx_33 from checkbox within u_multiple_chkbx
end type
type cbx_32 from checkbox within u_multiple_chkbx
end type
type cbx_31 from checkbox within u_multiple_chkbx
end type
type cbx_30 from checkbox within u_multiple_chkbx
end type
type cbx_29 from checkbox within u_multiple_chkbx
end type
type cbx_28 from checkbox within u_multiple_chkbx
end type
type cbx_27 from checkbox within u_multiple_chkbx
end type
type cbx_26 from checkbox within u_multiple_chkbx
end type
type cbx_25 from checkbox within u_multiple_chkbx
end type
type cbx_24 from checkbox within u_multiple_chkbx
end type
type cbx_23 from checkbox within u_multiple_chkbx
end type
type cbx_22 from checkbox within u_multiple_chkbx
end type
type cbx_21 from checkbox within u_multiple_chkbx
end type
type cbx_20 from checkbox within u_multiple_chkbx
end type
type cbx_19 from checkbox within u_multiple_chkbx
end type
type cbx_18 from checkbox within u_multiple_chkbx
end type
type cbx_17 from checkbox within u_multiple_chkbx
end type
type cbx_16 from checkbox within u_multiple_chkbx
end type
type cbx_15 from checkbox within u_multiple_chkbx
end type
type cbx_14 from checkbox within u_multiple_chkbx
end type
type cbx_13 from checkbox within u_multiple_chkbx
end type
type cbx_12 from checkbox within u_multiple_chkbx
end type
type cbx_11 from checkbox within u_multiple_chkbx
end type
type cbx_10 from checkbox within u_multiple_chkbx
end type
type cbx_9 from checkbox within u_multiple_chkbx
end type
type cbx_8 from checkbox within u_multiple_chkbx
end type
type cbx_7 from checkbox within u_multiple_chkbx
end type
type cbx_6 from checkbox within u_multiple_chkbx
end type
type cbx_5 from checkbox within u_multiple_chkbx
end type
type cbx_4 from checkbox within u_multiple_chkbx
end type
type cbx_3 from checkbox within u_multiple_chkbx
end type
type cbx_2 from checkbox within u_multiple_chkbx
end type
type cbx_1 from checkbox within u_multiple_chkbx
end type
end forward

global type u_multiple_chkbx from userobject
integer width = 1285
integer height = 1652
long backcolor = 12632256
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_additem ( string ls_description,  string ls_value,  string ls_item,  long ll_row )
event ue_clear ( )
event ue_setup ( )
event ue_getresult ( ref string as_value[] )
event ue_test ( )
event ue_resize ( )
event ue_changeitem ( string as_item,  string as_value )
event ue_update ( )
event type integer ue_updateable ( )
cbx_48 cbx_48
cbx_47 cbx_47
cbx_46 cbx_46
cbx_45 cbx_45
cbx_44 cbx_44
cbx_43 cbx_43
cbx_42 cbx_42
cbx_41 cbx_41
cbx_40 cbx_40
cbx_39 cbx_39
cbx_38 cbx_38
cbx_37 cbx_37
cbx_36 cbx_36
cbx_35 cbx_35
cbx_34 cbx_34
cbx_33 cbx_33
cbx_32 cbx_32
cbx_31 cbx_31
cbx_30 cbx_30
cbx_29 cbx_29
cbx_28 cbx_28
cbx_27 cbx_27
cbx_26 cbx_26
cbx_25 cbx_25
cbx_24 cbx_24
cbx_23 cbx_23
cbx_22 cbx_22
cbx_21 cbx_21
cbx_20 cbx_20
cbx_19 cbx_19
cbx_18 cbx_18
cbx_17 cbx_17
cbx_16 cbx_16
cbx_15 cbx_15
cbx_14 cbx_14
cbx_13 cbx_13
cbx_12 cbx_12
cbx_11 cbx_11
cbx_10 cbx_10
cbx_9 cbx_9
cbx_8 cbx_8
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
end type
global u_multiple_chkbx u_multiple_chkbx

type variables
checkbox icbx_tests[48]
string is_item[48], is_value[48], is_des[48]
integer ii_maxrow = 24, ii_maxcol = 2





end variables
event ue_additem(string ls_description, string ls_value, string ls_item, long ll_row);Integer li

FOR li = 1 to 48
	IF is_item[li] = "" THEN
		is_item[li] = ls_item
		is_value[li] = ls_value
		is_des[li] = ls_description
		RETURN
	END IF		
NEXT
end event

event ue_clear();Integer li

FOR li = 1 to 48
	is_item[li] = ""
	is_value[li] = "N"
	is_des[li] = ""
	icbx_tests[li].visible = FALSE
NEXT
end event

event ue_setup();Integer li
FOR li = 1 to 48
	IF is_item[li] <> "" THEN
		icbx_tests[li].visible = TRUE
		icbx_tests[li].text = is_des[li]
		IF is_value[li] = "Y" THEN
			icbx_tests[li].checked = TRUE
		ELSE
			icbx_tests[li].checked = FALSE
		END IF
	ELSE
		icbx_tests[li].visible = FALSE
		is_value[li] = "N"
	END IF
NEXT
end event

event ue_getresult(ref string as_value[]);Integer li, li_count= 0

FOR li = 1 to 48
	IF icbx_tests[li].checked THEN
		li_count += 1
		as_value[li_count] = is_item[li]
	END IF
NEXT
end event

event ue_test();Integer li

FOR li = 1 TO 48
	IF ISVALID(icbx_tests[li]) THEN icbx_tests[li].text = "Test " + string(li)
NEXT
end event

event ue_resize();IF this.height >= 1652 THEN
	this.vscrollbar = FALSE
ELSE
	this.vscrollbar = TRUE
END IF


end event

event ue_changeitem(string as_item, string as_value);Integer li
FOR li = 1 to 48
	IF is_item[li] = as_item THEN
		IF as_value = "Y" THEN
			icbx_tests[li].checked = TRUE
		ELSE
			icbx_tests[li].checked = FALSE
		END IF
	END IF
NEXT
		
end event

on u_multiple_chkbx.create
this.cbx_48=create cbx_48
this.cbx_47=create cbx_47
this.cbx_46=create cbx_46
this.cbx_45=create cbx_45
this.cbx_44=create cbx_44
this.cbx_43=create cbx_43
this.cbx_42=create cbx_42
this.cbx_41=create cbx_41
this.cbx_40=create cbx_40
this.cbx_39=create cbx_39
this.cbx_38=create cbx_38
this.cbx_37=create cbx_37
this.cbx_36=create cbx_36
this.cbx_35=create cbx_35
this.cbx_34=create cbx_34
this.cbx_33=create cbx_33
this.cbx_32=create cbx_32
this.cbx_31=create cbx_31
this.cbx_30=create cbx_30
this.cbx_29=create cbx_29
this.cbx_28=create cbx_28
this.cbx_27=create cbx_27
this.cbx_26=create cbx_26
this.cbx_25=create cbx_25
this.cbx_24=create cbx_24
this.cbx_23=create cbx_23
this.cbx_22=create cbx_22
this.cbx_21=create cbx_21
this.cbx_20=create cbx_20
this.cbx_19=create cbx_19
this.cbx_18=create cbx_18
this.cbx_17=create cbx_17
this.cbx_16=create cbx_16
this.cbx_15=create cbx_15
this.cbx_14=create cbx_14
this.cbx_13=create cbx_13
this.cbx_12=create cbx_12
this.cbx_11=create cbx_11
this.cbx_10=create cbx_10
this.cbx_9=create cbx_9
this.cbx_8=create cbx_8
this.cbx_7=create cbx_7
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.Control[]={this.cbx_48,&
this.cbx_47,&
this.cbx_46,&
this.cbx_45,&
this.cbx_44,&
this.cbx_43,&
this.cbx_42,&
this.cbx_41,&
this.cbx_40,&
this.cbx_39,&
this.cbx_38,&
this.cbx_37,&
this.cbx_36,&
this.cbx_35,&
this.cbx_34,&
this.cbx_33,&
this.cbx_32,&
this.cbx_31,&
this.cbx_30,&
this.cbx_29,&
this.cbx_28,&
this.cbx_27,&
this.cbx_26,&
this.cbx_25,&
this.cbx_24,&
this.cbx_23,&
this.cbx_22,&
this.cbx_21,&
this.cbx_20,&
this.cbx_19,&
this.cbx_18,&
this.cbx_17,&
this.cbx_16,&
this.cbx_15,&
this.cbx_14,&
this.cbx_13,&
this.cbx_12,&
this.cbx_11,&
this.cbx_10,&
this.cbx_9,&
this.cbx_8,&
this.cbx_7,&
this.cbx_6,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1}
end on

on u_multiple_chkbx.destroy
destroy(this.cbx_48)
destroy(this.cbx_47)
destroy(this.cbx_46)
destroy(this.cbx_45)
destroy(this.cbx_44)
destroy(this.cbx_43)
destroy(this.cbx_42)
destroy(this.cbx_41)
destroy(this.cbx_40)
destroy(this.cbx_39)
destroy(this.cbx_38)
destroy(this.cbx_37)
destroy(this.cbx_36)
destroy(this.cbx_35)
destroy(this.cbx_34)
destroy(this.cbx_33)
destroy(this.cbx_32)
destroy(this.cbx_31)
destroy(this.cbx_30)
destroy(this.cbx_29)
destroy(this.cbx_28)
destroy(this.cbx_27)
destroy(this.cbx_26)
destroy(this.cbx_25)
destroy(this.cbx_24)
destroy(this.cbx_23)
destroy(this.cbx_22)
destroy(this.cbx_21)
destroy(this.cbx_20)
destroy(this.cbx_19)
destroy(this.cbx_18)
destroy(this.cbx_17)
destroy(this.cbx_16)
destroy(this.cbx_15)
destroy(this.cbx_14)
destroy(this.cbx_13)
destroy(this.cbx_12)
destroy(this.cbx_11)
destroy(this.cbx_10)
destroy(this.cbx_9)
destroy(this.cbx_8)
destroy(this.cbx_7)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
end on

type cbx_48 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1568
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[48] = this

end event

type cbx_47 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1500
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[47] = this
end event

type cbx_46 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1432
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[46] = this
end event

type cbx_45 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1364
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[45] = this
end event

type cbx_44 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1296
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[44] = this
end event

type cbx_43 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1228
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[43] = this
end event

type cbx_42 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1160
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[42] = this
end event

type cbx_41 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1092
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[41] = this
end event

type cbx_40 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 1024
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[40] = this
end event

type cbx_39 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 956
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[39] = this
end event

type cbx_38 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 892
integer width = 631
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[38] = this
end event

type cbx_37 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 824
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[37] = this
end event

type cbx_36 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 756
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[36] = this
end event

type cbx_35 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 688
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[35] = this
end event

type cbx_34 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 620
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[34] = this

end event

type cbx_33 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 552
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[33] = this
end event

type cbx_32 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 484
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[32] = this
end event

type cbx_31 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 416
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[31] = this
end event

type cbx_30 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 280
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[30] = this
end event

type cbx_29 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 348
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[29] = this
end event

type cbx_28 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 212
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[28] = this
end event

type cbx_27 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 144
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[27] = this
end event

type cbx_26 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 76
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[26] = this
end event

type cbx_25 from checkbox within u_multiple_chkbx
integer x = 617
integer y = 8
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[25] = this
end event

type cbx_24 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1576
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[24] = this
end event

type cbx_23 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1508
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[23] = this
end event

type cbx_22 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1440
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[22] = this
end event

type cbx_21 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1372
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[21] = this
end event

type cbx_20 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1304
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[20] = this
end event

type cbx_19 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1236
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[19] = this
end event

type cbx_18 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1168
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[18] = this
end event

type cbx_17 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1100
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[17] = this
end event

type cbx_16 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 1032
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[16] = this
end event

type cbx_15 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 964
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[15] = this
end event

type cbx_14 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 896
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[14] = this
end event

type cbx_13 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 828
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[13] = this
end event

type cbx_12 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 760
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[12] = this
end event

type cbx_11 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 692
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[11] = this
end event

type cbx_10 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 624
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[10] = this
end event

type cbx_9 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 556
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[9] = this
end event

type cbx_8 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 488
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[8] = this
end event

type cbx_7 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 420
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[7] = this
end event

type cbx_6 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 352
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[6] = this
end event

type cbx_5 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 284
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[5] = this
end event

type cbx_4 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 216
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[4] = this
end event

type cbx_3 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 148
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[3] = this
end event

type cbx_2 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 80
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[2] = this
end event

type cbx_1 from checkbox within u_multiple_chkbx
integer x = 9
integer y = 8
integer width = 631
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 12632256
string text = "none"
end type

event constructor;icbx_tests[1] = this
end event

