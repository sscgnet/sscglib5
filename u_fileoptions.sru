HA$PBExportHeader$u_fileoptions.sru
forward
global type u_fileoptions from nonvisualobject
end type
end forward

global type u_fileoptions from nonvisualobject
end type
global u_fileoptions u_fileoptions

forward prototypes
public function integer uo_copyfile (string as_original, string as_new, boolean ab_ask, boolean ab_overwrite)
end prototypes

public function integer uo_copyfile (string as_original, string as_new, boolean ab_ask, boolean ab_overwrite);IF FileExists(as_new) AND NOT ab_overwrite THEN
	IF ab_ask THEN
		Messagebox("Problem Copying","File already exists " + as_new)
	END IF
	RETURN -1
END IF

IF FileExists(as_original) THEN
	IF FileCopy(as_original, as_new, TRUE) <> 1 THEN
		IF ab_ask THEN Messagebox("Problem Copying",  as_original + " to " + as_new)
		RETURN -1
	ELSE
		IF ab_ask THEN Messagebox("Successful",as_new + " has been successfully created.")
		RETURN 1
	END IF
ELSE
	IF ab_ask THEN Messagebox("Error", as_original + " does not exist")
END IF
RETURN -1

end function

on u_fileoptions.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_fileoptions.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

