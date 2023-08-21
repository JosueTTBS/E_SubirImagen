page 50200 Main
{
    ApplicationArea = All;
    Caption = 'Main';
    PageType = List;
    SourceTable = ObjetosEquis;
    UsageCategory = Administration;
    CardPageId = ExampleCardPage;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Titulo; Rec.Titulo)
                {
                    ToolTip = 'Specifies the value of the Titulo field.';
                }
                field(Imagen; Rec.Imagen)
                {
                    ToolTip = 'Specifies the value of the Imagen field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        v_TempBlob: Codeunit "Temp Blob";
                        v_Instr: InStream;
                        v_OutStr: OutStream;
                        v_ReadTxt: Text;
                        v_Writetxt: Text;
                        v_XMLDoc: XmlDocument;
                    begin
                        // Rec.Imagen := Rec.Imagen.CreateInStream();
                        v_TempBlob.CreateInStream(v_Instr);
                        v_TempBlob.CreateOutStream(v_OutStr);

                        v_XMLDoc.WriteTo(v_OutStr);
                        v_OutStr.WriteText(v_Writetxt);
                        v_Instr.ReadText(v_Writetxt);
                        v_ReadTxt := 'CFDIv4 ' + '.XML';
                        DownloadFromStream(v_Instr, '', '', '', v_ReadTxt);
                    end;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(agregado; Rec.agregado)
                {
                    ToolTip = 'Specifies the value of the agregado field.';
                }
                field(modificado; Rec.modificado)
                {
                    ToolTip = 'Specifies the value of the modificado field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CargarImagen)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';


                trigger OnAction()
                begin

                end;


            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin

    end;

    var
}
