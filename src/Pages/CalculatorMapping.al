page 50100 "CCO Calculator Mapping"
{
    Caption = 'Calculator Mapping';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "CCO Calculator Mapping";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("CCO ID"; Rec."CCO ID")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Field: Record Field;
                        FieldSelection: Codeunit "Field Selection";
                        TableFilter: Record "Table Filter";
                    begin
                        Field.SetRange(TableNo, Database::"Sales Line");
                        if Field.Get(Database::"Sales Line", Rec."CCO ID") then;

                        if FieldSelection.Open(Field) then begin
                            Rec.Validate("CCO ID", Field."No.");
                            Rec.Validate("CCO Object Name", Field.FieldName);
                        end;
                    end;
                }
                field("CCO Object Name"; Rec."CCO Object Name")
                {
                    ApplicationArea = All;
                }
                field("CCO Calculation"; Rec."CCO Calculation")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}