HA$PBExportHeader$u_oleobject.sru
forward
global type u_oleobject from oleobject
end type
end forward

global type u_oleobject from oleobject
end type
global u_oleobject u_oleobject

type variables
string is_csheet
oleobject ole_sheet

end variables

forward prototypes
public function boolean of_excel_info (string as_option, string as_value, string as_type)
public function boolean of_excelopen (string as_filename)
public function integer of_excelsave (string as_filename)
public function integer of_exceldisconnect ()
public function string of_excelread (string as_option)
public function string of_excelread (string as_option, string as_format)
end prototypes

public function boolean of_excel_info (string as_option, string as_value, string as_type);integer lpos, li_row, li_col
string ls_sheet
lpos = pos(as_option,":")
IF lpos > 0 THEN
	ls_sheet = Left(as_option,lpos - 1)
	as_option = Right(as_option,len(as_option) - lpos)
	IF is_csheet <> ls_sheet THEN  
		ole_sheet = this.Application.ActiveWorkbook.Worksheets(ls_sheet)
		is_csheet = ls_sheet
	END IF
END IF
li_col = pos("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Left(as_option,1))
li_row = Integer(Right(as_option, len(as_option) - 1))
IF li_row > 0 AND li_col > 0 THEN
	ole_sheet.Cells[li_row,li_col] = as_value
	RETURN TRUE
END IF
RETURN FALSE
end function

public function boolean of_excelopen (string as_filename);IF this.ConnectToNewObject("excel.application") <> 0 THEN
	Messagebox("Error","Microsoft Excel is not supported on your computer")
	RETURN FALSE
END IF
IF NOT FileExists(as_filename) THEN
	Messagebox("Error",as_filename + " does not exist")
	RETURN FALSE
END IF
this.Application.Workbooks.Open(as_filename)
ole_sheet = this.Application.ActiveWorkbook.WorkSheets[1]
RETURN TRUE
end function

public function integer of_excelsave (string as_filename);//this.visible = TRUE
this.Application.ActiveWorkbook.SaveAs(as_filename)
of_exceldisconnect()
RETURN 1

end function

public function integer of_exceldisconnect ();this.application.activeworkbook.save() 
this.Application.Workbooks.Close()
//this.Application.ActiveWorkbook.Quit
this.Disconnectobject()
RETURN 1

end function

public function string of_excelread (string as_option);integer lpos, li_row, li_col
string ls_sheet, ls_ret
lpos = pos(as_option,":")
IF lpos > 0 THEN
	ls_sheet = Left(as_option,lpos - 1)
	as_option = Right(as_option,len(as_option) - lpos)
	IF is_csheet <> ls_sheet THEN  
		ole_sheet = this.Application.ActiveWorkbook.Worksheets(ls_sheet)
		is_csheet = ls_sheet
	END IF
END IF
li_col = pos("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Left(as_option,1))
li_row = Integer(Right(as_option, len(as_option) - 1))
IF li_row > 0 AND li_col > 0 THEN
	ls_ret = String(ole_sheet.Cells[li_row,li_col].Value)
	RETURN ls_ret
END IF
RETURN "N/F"
end function

public function string of_excelread (string as_option, string as_format);integer lpos, li_row, li_col
string ls_sheet, ls_ret
lpos = pos(as_option,":")
IF lpos > 0 THEN
	ls_sheet = Left(as_option,lpos - 1)
	as_option = Right(as_option,len(as_option) - lpos)
	IF is_csheet <> ls_sheet THEN  
		ole_sheet = this.Application.ActiveWorkbook.Worksheets(ls_sheet)
		is_csheet = ls_sheet
	END IF
END IF
li_col = pos("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Left(as_option,1))
li_row = Integer(Right(as_option, len(as_option) - 1))
IF li_row > 0 AND li_col > 0 THEN
	ls_ret = String(ole_sheet.Cells[li_row,li_col].Value)
	CHOOSE CASE as_format
	CASE "decimal"
		ls_ret = String(dec(ls_ret),"0.00")
	//20190110 SB added type
	CASE "long"
		ls_ret = String(long(ls_ret),"0")
	CASE "date"
		IF ls_ret = "" THEN RETURN ""
		ls_ret = String(date(ls_ret),"mm/dd/yy")
	END CHOOSE
	RETURN ls_ret
END IF
RETURN "N/F"
end function

on u_oleobject.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_oleobject.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

