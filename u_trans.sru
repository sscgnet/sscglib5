HA$PBExportHeader$u_trans.sru
forward
global type u_trans from nonvisualobject
end type
end forward

global type u_trans from nonvisualobject
end type
global u_trans u_trans

type variables
transaction n_trans
string is_table_type 
boolean ib_connect
st_profile ist_profile
end variables

forward prototypes
public function integer of_create_table (string as_table, string as_def)
public function integer of_create_field (string as_table, string as_def)
public function integer of_delete_field (string as_table, string as_def)
public function boolean of_get_sql (string as_title)
public function integer of_get_sqlcode (string as_title)
public function integer of_change_field (string as_table, string as_field, string as_def)
public function integer of_set_isam ()
public function integer of_move_field (string ls_table, string ls_field, string ls_def, string ls_after)
public function boolean of_check_field (string as_table, string as_def)
public function integer of_execute_sql (string ls_exe, long ll_dbcode)
public function boolean of_disconnect ()
public function boolean of_setup_profile (string as_profile)
public function boolean of_connect ()
public function integer of_check_schema (string as_table, string as_field, string as_type)
public function integer of_schema_location (string as_table, string as_field)
end prototypes

public function integer of_create_table (string as_table, string as_def);string new_sql
n_trans.autocommit = TRUE

new_sql = "CREATE TABLE " + as_table + " (" + as_def + ")" + is_table_type
EXECUTE IMMEDIATE :new_sql USING n_trans;

n_trans.autocommit = FALSE


IF n_trans.sqlcode <> 0 THEN 
	CHOOSE CASE n_trans.sqldbcode
	CASE -1303, 1050
		RETURN 0
	CASE ELSE
		of_get_sql("Create Table " + as_table)
	END CHOOSE	
END IF
RETURN n_trans.sqlcode
end function

public function integer of_create_field (string as_table, string as_def);string new_sql
integer lpos
n_trans.autocommit = TRUE

lpos = pos(as_def,"char(32766)")
IF lpos > 0 THEN as_def = Left(as_def,lpos - 1) + "TEXT"
new_sql = "ALTER TABLE " + as_table + " ADD " + as_def 
EXECUTE IMMEDIATE :new_sql USING n_trans;

n_trans.autocommit = FALSE

//  Don't print warning and continue if field is already there
CHOOSE CASE n_trans.sqldbcode
	CASE -1508, -1304, 1060
		RETURN -100
END CHOOSE
RETURN of_get_sqlcode("Create Field " + as_table + ":" + new_sql)
end function

public function integer of_delete_field (string as_table, string as_def);string new_sql
n_trans.autocommit = TRUE

new_sql = "ALTER TABLE " + as_table + " DROP " + as_def 
EXECUTE IMMEDIATE :new_sql USING n_trans;

n_trans.autocommit = FALSE

RETURN of_get_sqlcode("Delete Field " + as_table + "-" + as_def)
end function

public function boolean of_get_sql (string as_title);string ls_message, ls_message2
IF n_trans.sqlcode <> 0 THEN
	IF n_trans.sqlcode = 100 THEN
		Messagebox("Information Not Found", as_title)
	ELSE
		ls_message = "Location:  " + as_title + "~r~n~r~n" + &
			"Code:  " + string(n_trans.sqlcode) + "~r~n~r~n" + &
			"DB Code:  " + string(n_trans.sqldbcode) + "~r~n~r~n" + &
			"Error Text:  " + string(n_trans.sqlerrtext) + "~r~n~r~n"
		CHOOSE CASE n_trans.sqldbcode
		CASE -1102
			IF Messagebox("SQL Locked Message",n_trans.sqlerrtext + &
				"~r~n~r~nDo you wish to try again?", Question!, YesNo!,1) = 2 THEN
					RETURN TRUE
			END IF
		CASE 1064
			ls_message2 = "MYSQL Users only-check 'Ignore space " + &
				"after function names' in your ODBC drive"
			IF Messagebox("SQL Error", ls_message2 + &
					"  Do you wish to print",Question!,YesNo!,2) = 1 THEN
					print_error(ls_message)
			END IF
		CASE 0
			RETURN TRUE
		CASE ELSE
			IF Messagebox("SQL Error", ls_message + &
					"  Do you wish to print",Question!,YesNo!,2) = 1 THEN
					print_error(ls_message)
				END IF
		END CHOOSE
	END IF
	RETURN FALSE
END IF
RETURN TRUE
end function

public function integer of_get_sqlcode (string as_title);string li_message
IF n_trans.sqlcode <> 0 THEN
	IF n_trans.sqlcode = 100 THEN
	ELSE
		li_message = "Location:  " + as_title + "~r~n~r~n" + &
			"Code:  " + string(n_trans.sqlcode) + "~r~n~r~n" + &
			"DB Code:  " + string(n_trans.sqldbcode) + "~r~n~r~n" + &
			"Error Text:  " + string(n_trans.sqlerrtext) + "~r~n~r~n"
		IF Messagebox("SQL Error", li_message + &
			"  Do you wish to print",Question!,YesNo!,2) = 1 THEN
				print_error(li_message)
		END IF
	END IF
END IF
RETURN n_trans.sqlcode
end function

public function integer of_change_field (string as_table, string as_field, string as_def);string new_sql

new_sql = "ALTER TABLE " + as_table + " MODIFY " + as_field + as_def

EXECUTE IMMEDIATE :new_sql USING n_trans;
of_get_sql("Change Field " + as_table + "." + as_field)


//IF of_create_field(as_table, as_field + "Z " + as_def) = 0 THEN
//	n_trans.autocommit = TRUE
//	new_sql = "UPDATE " + as_table + " SET " + as_table + "." + as_field + "Z = " + &
//		as_table + "." + as_field 
//	EXECUTE IMMEDIATE :new_sql USING n_trans;
//	IF get_sql("Change Field-Copy 1 " + as_table) THEN
//		IF delete_field(as_table, as_field) = 0 THEN
//			IF create_field(as_table, as_field + " " + as_def) = 0 THEN
//				n_trans.autocommit = TRUE
//				new_sql = "UPDATE " + as_table + " SET " + as_table + "." + as_field + " = " + &
//					as_table + "." + as_field + "Z"
//				EXECUTE IMMEDIATE :new_sql USING n_trans;
//				IF get_sql("Change Field-Copy 2 " + as_table) THEN
//					delete_field(as_table, as_field + "Z")		
//				END IF
//			END IF
//		END IF
//	END IF
//END IF
//n_trans.autocommit = FALSE

RETURN n_trans.sqlcode
end function

public function integer of_set_isam ();is_table_type =  " ENGINE=MyISAM"
RETURN 1
end function

public function integer of_move_field (string ls_table, string ls_field, string ls_def, string ls_after);string new_sql

new_sql = "ALTER TABLE " + ls_table + " MODIFY COLUMN " + ls_field + " " + ls_def + " AFTER " + ls_after
EXECUTE IMMEDIATE :new_sql USING n_trans;
of_get_sql("Move Field " + ls_table + " " + ls_field) 

RETURN n_trans.sqlcode
end function

public function boolean of_check_field (string as_table, string as_def);string new_sql
integer lpos

new_sql = "SELECT " + as_def + " FROM " + as_table 
EXECUTE IMMEDIATE :new_sql USING n_trans;

n_trans.autocommit = FALSE

//  Don't print warning and continue if field is already there
CHOOSE CASE n_trans.sqldbcode
	CASE 0
		RETURN TRUE
END CHOOSE
RETURN FALSE
end function

public function integer of_execute_sql (string ls_exe, long ll_dbcode);EXECUTE IMMEDIATE :ls_exe USING n_trans;

IF n_trans.sqldbcode = ll_dbcode THEN RETURN -1

string li_message
IF n_trans.sqlcode <> 0 THEN
	IF n_trans.sqlcode = 100 THEN
	ELSE
		li_message = "Location:  " + ls_exe + "~r~n~r~n" + &
			"Code:  " + string(n_trans.sqlcode) + "~r~n~r~n" + &
			"DB Code:  " + string(n_trans.sqldbcode) + "~r~n~r~n" + &
			"Error Text:  " + string(n_trans.sqlerrtext) + "~r~n~r~n"
		IF Messagebox("SQL Error", li_message + &
			"  Do you wish to print",Question!,YesNo!,2) = 1 THEN
				print_error(li_message)
		END IF
	END IF
END IF
RETURN n_trans.sqlcode
end function

public function boolean of_disconnect ();string ls_error

IF  ib_connect THEN 
	DISCONNECT using n_trans;
	DESTROY n_trans
	ib_connect = FALSE
END IF
	
RETURN ib_connect
end function

public function boolean of_setup_profile (string as_profile);ist_profile.ss_host = ProfileString(gs_ini,as_profile,"Host","")
ist_profile.ss_dbase = ProfileString(gs_ini,as_profile,"Database","")
ist_profile.ss_user = ProfileString(gs_ini,as_profile,"User","")
ist_profile.ss_password = ProfileString(gs_ini,as_profile,"Password","")

IF ist_profile.ss_host = "" OR ist_profile.ss_dbase = "" OR ist_profile.ss_user = "" THEN 
	Messagebox("Connection Error",as_profile + " not setup at this time")
	RETURN FALSE
END IF

RETURN TRUE
end function

public function boolean of_connect ();string ls_error, ls_password

IF ib_connect THEN RETURN TRUE
n_trans = CREATE transaction
ls_password = ist_profile.ss_password
IF UPPER(ls_password) = "NONE" THEN ls_password = ""
ls_error = connect_odbc("web", ist_profile.ss_host, ist_profile.ss_user, ls_password, ist_profile.ss_dbase,n_trans)
IF ls_error = "Connected" THEN
	ib_connect = TRUE
ELSE
	ib_connect = FALSE
	Messagebox("Connection Error",ls_error)
END IF
	
RETURN ib_connect
end function

public function integer of_check_schema (string as_table, string as_field, string as_type);String ls_type
Integer li_length

	SELECT DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
		INTO :ls_type, :li_length
 	 FROM INFORMATION_SCHEMA.COLUMNS
  		WHERE table_name = :as_table AND COLUMN_NAME = :as_field USING n_trans;
		  
	IF n_trans.sqlcode < 0 OR n_trans.sqlcode = 100 THEN RETURN -1
			IF ls_type = "char" OR ls_type = "varchar" THEN
				IF as_type <> "N/F" THEN
					IF as_type <> "char(" + string(li_length) + ")" THEN
						RETURN 1
					     //Messagebox(ls_name,ls_name + " " + ls_type + " " + string(li_length) + " to " +as_type)
					END IF
				END IF
			ELSE
				IF as_type = "char(32766)" THEN as_type = "text"
				IF Upper(ls_type) <> Upper(as_type) THEN
					RETURN 1
				     //Messagebox(ls_name,ls_name + " " + ls_type + " " + string(li_length) + " to " +as_type)
				END IF
			END IF
RETURN 0
end function

public function integer of_schema_location (string as_table, string as_field);String ls_type, ls_dtype, ls_name
Integer li_length, li = 0

	DECLARE get_columns CURSOR FOR
	SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
 	 FROM INFORMATION_SCHEMA.COLUMNS
  		WHERE table_name = :as_table USING n_trans;

	OPEN get_columns;
	
	IF n_trans.sqlcode = -1 THEN RETURN 0

	FETCH get_columns INTO :ls_name, :ls_type, :li_length;
	
	DO WHILE n_trans.sqlcode = 0
		li += 1
		IF ls_name = as_field THEN
			RETURN li
		END IF
		FETCH get_columns INTO :ls_name, :ls_type, :li_length;
	LOOP

	CLOSE get_columns;
RETURN 0
end function

on u_trans.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_trans.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

