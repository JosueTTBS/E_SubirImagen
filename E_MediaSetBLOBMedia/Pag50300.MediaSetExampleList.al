page 50300 "MediaSetExampleList"
{
    ApplicationArea = All;
    Caption = 'MediaSetExampleList';
    PageType = List;
    SourceTable = MediaSetExample;
    UsageCategory = Lists;
    CardPageId = MediaSetExampleCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(MyField; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MyField field.';
                }
                field(Media1; Rec.Media1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Media1 field.';
                }
                field(MediaSet1; Rec.MediaSet1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MediaSet1 field.';
                }
                field("Blob"; Rec."Blob")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blob field.';
                }
            }
        }
        // E area de facbos son los que aparecen del lado derecho que se puede ocultar y mostar con un simbolo como de informacion 
        area(FactBoxes)
        {
            part(MediaFactbox; MediaFactbox)
            {
                ApplicationArea = all;
                SubPageLink = Code = field(Code);
            }
        }
    }
}