HA$PBExportHeader$u_scrollbar.sru
forward
global type u_scrollbar from statictext
end type
end forward

global type u_scrollbar from statictext
integer width = 50
integer height = 540
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "SizeWE!"
long textcolor = 8388608
long backcolor = 8388608
boolean focusrectangle = false
event mousemove pbm_mousemove
event mousedown pbm_lbuttondown
event mouseup pbm_lbuttonup
end type
global u_scrollbar u_scrollbar

type variables
dragobject idrg_parent

Dragobject	idrg_TopLeft[]	//Reference to the Top Left control
Dragobject	idrg_TopRight[]	//Reference to the Top Right control

Boolean		ib_Debug=False	//Debug mode
Long			il_HiddenColor=0	//Bar hidden color to match the window background


Integer	cii_BarThickness
Constant Integer	cii_ParentBorder=15   //Window border to be used on all sides

Integer	cii_ParentTop, cii_ParentBottom




end variables

forward prototypes
public subroutine of_resizebars ()
public subroutine of_resizepanels ()
public subroutine of_parent (dragobject drg_object, long il_color)
end prototypes

event mousemove;Integer	li_prevposition, li_ctrl

If KeyDown(keyLeftButton!) Then
	// Store the previous position.
	li_prevposition = This.X

	// Refresh the Bar attributes.
	This.X = idrg_parent.PointerX()
	
	// Perform redraws when appropriate.
	//If Not IsValid(idrg_topright) or Not IsValid(idrg_topleft) Then Return
	FOR li_ctrl = 1 to Upperbound(idrg_topright)
		If li_prevposition > idrg_topright[li_ctrl].x Then idrg_topright[li_ctrl].setredraw(true)
	NEXT
	FOR li_ctrl = 1 to Upperbound(idrg_topleft)
		If li_prevposition < idrg_topleft[li_ctrl].x + idrg_topleft[li_ctrl].width Then idrg_topleft[li_ctrl].setredraw(true)
	NEXT
End If
end event

event mousedown;This.SetPosition(ToTop!)
//If Not ib_debug Then This.BackColor = 0  // Show Bar in Black while being moved.

end event

event mouseup;// Hide the bar
//If Not ib_Debug Then This.BackColor = il_HiddenColor

// Call the resize functions
of_ResizeBars()
of_ResizePanels()

end event

public subroutine of_resizebars ();cii_ParentTop = idrg_parent.x
cii_ParentBottom = idrg_parent.x + idrg_parent.height

this.Move (this.X, cii_ParentBorder + cii_ParentTop)
this.Resize (cii_Barthickness, 5 + cii_ParentBottom - (cii_ParentBorder + cii_ParentTop))

end subroutine

public subroutine of_resizepanels ();Integer li_ctrl

cii_ParentTop = idrg_parent.x
cii_ParentBottom = idrg_parent.x + idrg_parent.height

// TopLeft processing
FOR li_ctrl = 1 to Upperbound(idrg_TopLeft)
	IF li_ctrl = Upperbound(idrg_TopLeft) THEN
		idrg_TopLeft[li_ctrl].Resize(this.X - idrg_TopLeft[li_ctrl].X, cii_ParentBottom - idrg_TopLeft[li_ctrl].Y)
	ELSE
		idrg_TopLeft[li_ctrl].Resize(this.X - idrg_TopLeft[li_ctrl].X, idrg_TopLeft[li_ctrl].Height)
	END IF		
NEXT

// TopRight Processing
FOR li_ctrl = 1 to Upperbound(idrg_TopRight)
	idrg_TopRight[li_ctrl].X = this.X + this.Width
	IF li_ctrl = Upperbound(idrg_TopRight) THEN
		idrg_TopRight[li_ctrl].Resize(idrg_parent.Width  - idrg_TopRight[li_ctrl].x ,  cii_ParentBottom - idrg_TopRight[li_ctrl].Y)
	ELSE
		idrg_TopRight[li_ctrl].Resize(idrg_parent.Width  - idrg_TopRight[li_ctrl].x ,  idrg_TopRight[li_ctrl].Height)
	END IF
NEXT


end subroutine

public subroutine of_parent (dragobject drg_object, long il_color); idrg_parent = drg_object
 
cii_ParentTop = drg_object.x
cii_ParentBottom = drg_object.x + drg_object.height
il_hiddencolor = il_color

this.BackColor = il_Hiddencolor

end subroutine

on u_scrollbar.create
end on

on u_scrollbar.destroy
end on

event constructor;this.BackColor = il_HiddenColor
cii_BarThickness = this.width

end event

