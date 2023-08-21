page 50600 myPage
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ObjetosEquis;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec.Titulo)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}