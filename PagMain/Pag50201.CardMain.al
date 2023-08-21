// Enlazada con la 50200 main 
page 50201 ExampleCardPage
{
    PageType = Card;
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
                field(Imagen; Rec.Imagen)
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