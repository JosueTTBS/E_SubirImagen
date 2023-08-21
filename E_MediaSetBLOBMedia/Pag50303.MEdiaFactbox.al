page 50303 "MediaFactbox"
{
    Caption = 'Caption';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MediaSetExample;

    layout
    {
        area(Content)
        {
            field(Media1; Rec.Media1)
            {
                ApplicationArea = All;
            }
            field(MediaSet1; Rec.MediaSet1)
            {
                ApplicationArea = All;
            }
            field(Blob1; Rec.Blob)
            {
                ApplicationArea = All;
            }
        }
    }
}