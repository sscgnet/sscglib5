HA$PBExportHeader$n_appserver.sru
forward
global type n_appserver from nonvisualobject
end type
end forward

global type n_appserver from nonvisualobject
end type
global n_appserver n_appserver

forward prototypes
public function integer of_setuser (string as_user)
end prototypes

public function integer of_setuser (string as_user);
RETURN 1

end function

on n_appserver.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_appserver.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

