table 50200 ObjetosEquis
{
    Caption = 'Objetos';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Titulo; Text[50])
        {
            Caption = 'Titulo';
        }
        field(2; Imagen; Blob)
        {
            Caption = 'Imagen';
            Subtype = Bitmap;

            trigger OnValidate()
            begin
                PictureUpdated := true;
            end;


        }
        field(3; agregado; DateTime)
        {
            Caption = 'agregado';
        }
        field(4; modificado; DateTime)
        {
            Caption = 'modificado';
        }
    }
    keys
    {
        key(PK; Titulo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        Pagregado();
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        Pmodificado();
    end;


    trigger OnDelete()
    var
        myInt: Integer;
    begin

    end;

    trigger OnRename()
    var
        myInt: Integer;
    begin
        Pmodificado();
    end;

    protected procedure Pagregado()
    begin
        "agregado" := CurrentDateTime();
        // "Last Date Modified" := Today();
        // OnAfterSetLastModifiedDateTime(Rec);
    end;

    protected procedure Pmodificado()
    begin
        "modificado" := CurrentDateTime();
    end;

    procedure SetPictureFromBlob(TempBlob: Codeunit "Temp Blob")
    var
        RecordRef: RecordRef;
    begin
        RecordRef.GetTable(Rec);
        TempBlob.ToRecordRef(RecordRef, FieldNo(Imagen));
        RecordRef.SetTable(Rec);
    end;

    var
        myVar: Page "Item List";
        myVar1: Page "Item Picture";
        myvar11: Page "Item Card";
        myvar12: Record Item;
        myvar2: Page "Customer List";
        myvar3: Record "Customer";
        PictureUpdated: Boolean;


}
