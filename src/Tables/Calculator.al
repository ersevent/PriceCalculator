table 50101 "CCO Calculator"
{
    Caption = 'CCO Calculator';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "CCO No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;
        }
        field(2; "CCO Value"; Code[25])
        {
            Caption = 'Value';
        }
        field(3; "CCO Unit of Measure"; Code[25])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
        }
        field(4; "CCO Quantity"; Integer)
        {
            Caption = 'Quantity';
        }
    }
    keys
    {
        key(PK; "CCO No.")
        {
            Clustered = true;
        }
    }
}
