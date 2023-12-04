pageextension 50101 "CCO Blanket Sales Order" extends "Blanket Sales Order"
{
    actions
    {
        addlast(processing)
        {
            action(CalculatePrice)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    Result: Decimal;
                begin
                    SalesLine.SetRange("Document No.", Rec."No.");
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    if SalesLine.FindSet() then
                        repeat begin
                            Result := SalesLine.CalculateItemPrice();
                            if Result <> SalesLine."CCO Calculated Price" then begin
                                SalesLine."CCO Calculated Price" := Result;
                                SalesLine.Modify();
                            end;
                        end;
                        until SalesLine.Next() = 0;
                end;
            }
        }
    }
}
