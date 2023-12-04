pageextension 50100 "CCO Blanket Sales Order Subf." extends "Blanket Sales Order Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field("CCO Calculated Price"; Rec."CCO Calculated Price")
            {
                ApplicationArea = All;
            }
        }
    }
}
