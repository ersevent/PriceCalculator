page 50101 "CCO Calculator"
{
    ApplicationArea = All;
    Caption = 'Calculator';
    PageType = List;
    SourceTable = "CCO Calculator";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("CCO Unit of Measure"; Rec."CCO Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("CCO Quantity"; Rec."CCO Quantity")
                {
                    ApplicationArea = All;
                }
                field("CCO Value"; Rec."CCO Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Change mapping")
            {
                Caption = 'Change mapping';
                ApplicationArea = All;
                RunObject = page "CCO Calculator Mapping";
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
            }
        }
    }
}
