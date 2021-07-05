HA$PBExportHeader$u_stringchars.sru
forward
global type u_stringchars from nonvisualobject
end type
end forward

global type u_stringchars from nonvisualobject
end type
global u_stringchars u_stringchars

forward prototypes
public function string of_fixcase (string as_string)
public function string of_trimspaces (string as_return)
end prototypes

public function string of_fixcase (string as_string);string ls_all = "", ls_letter
integer li
boolean lb_upper = TRUE

IF as_string = "SAME" THEN RETURN "SAME"
FOR li = 1 to len(as_string)
	ls_letter = mid(as_string,li,1)
	IF ls_letter = " " THEN 
		lb_upper = TRUE
	ELSE
		IF lb_upper THEN 
			ls_letter = Upper(ls_letter)
			lb_upper = FALSE
		ELSE
			ls_letter = Lower(ls_letter)
		END IF
	END IF
	ls_all += ls_letter
NEXT
RETURN ls_all	
		
	
end function

public function string of_trimspaces (string as_return);Integer li
String ls_return
FOR li = 1 to len(as_return)
	IF Mid(as_return,li,1) = " " THEN
	ELSE
		ls_return += mid(as_return,li,1)
	END IF
NEXT
RETURN ls_return
end function

on u_stringchars.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_stringchars.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

