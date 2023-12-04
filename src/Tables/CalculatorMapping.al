table 50100 "CCO Calculator Mapping"
{
    Caption = 'Calculator Mapping';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "CCO ID"; Integer)
        {
            Caption = 'ID';
        }
        field(2; "CCO Object Name"; Text[100])
        {
            Caption = 'Object Name';
            Editable = false;
        }
        field(3; "CCO Calculation"; Code[25])
        {
            Caption = 'Calculation';
        }
    }

    keys
    {
        key(PK; "CCO ID")
        {
            Clustered = true;
        }
    }
}
