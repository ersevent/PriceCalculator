tableextension 50100 "CCO Sales Line" extends "Sales Line"
{
    fields
    {
        field(50100; "CCO Calculated Price"; Decimal)
        {
            Caption = 'Calculated Price';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    procedure CalculateItemPrice() Result: Decimal
    var
        Calculator: Record "CCO Calculator";
        NextNumber: Decimal;
        PreviousNumber: Decimal;
        i: Integer;
        NoOfSubStr: Integer;
    begin
        Calculator.SetRange("CCO Unit of Measure", Rec."Unit of Measure Code");
        Calculator.SetRange("CCO Quantity", Rec.Quantity);
        if Calculator.FindFirst() then
            if Calculator."CCO Value" <> '' then begin
                NoOfSubStr := StrLen(DelChr(Calculator."CCO Value", '=', DelChr(Calculator."CCO Value", '=', ',')));
                if NoOfSubStr > 0 then
                    while i <= NoOfSubStr do begin
                        case Text.SelectStr(i + 1, Calculator."CCO Value") of
                            '*':
                                begin
                                    if Result = 0 then
                                        PreviousNumber := CalculateNumberForValue(i, Calculator."CCO Value");
                                    NextNumber := CalculateNumberForValue(i + 2, Calculator."CCO Value");

                                    if Result = 0 then
                                        Result := PreviousNumber * NextNumber
                                    else
                                        Result := Result * NextNumber;
                                end;
                            '/':
                                begin
                                    begin
                                        if Result = 0 then
                                            PreviousNumber := CalculateNumberForValue(i, Calculator."CCO Value");
                                        NextNumber := CalculateNumberForValue(i + 2, Calculator."CCO Value");

                                        if Result = 0 then
                                            Result := PreviousNumber / NextNumber
                                        else
                                            Result := Result / NextNumber;
                                    end;
                                end;
                        end;

                        i := i + 1;
                    end;
            end;
    end;

    local procedure CalculateNumberForValue(Place: Integer; CalculatorValue: Code[25]) Number: Decimal
    var
        CalculatorMapping: Record "CCO Calculator Mapping";
        DataTypeManagement: Codeunit "Data Type Management";
        RecRef: RecordRef;
        FieldRef: FieldRef;
        Substring: Text;
    begin
        Substring := Text.SelectStr(Place, CalculatorValue);
        if not Evaluate(Number, Substring) then begin
            CalculatorMapping.SetRange("CCO Calculation", Substring);
            if CalculatorMapping.FindFirst() then
                if DataTypeManagement.GetRecordRef(Rec, RecRef) then
                    if DataTypeManagement.FindFieldByName(RecRef, FieldRef, CalculatorMapping."CCO Object Name") then
                        Number := FieldRef.Value;
        end;
    end;
}
