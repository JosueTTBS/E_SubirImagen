// table 50100 "MediaSetExample"
// {
//     DataClassification = OrganizationIdentifiableInformation; 

//     fields
//     {
//         field(1; Code; Code[20])
//         {
//             DataClassification = OrganizationIdentifiableInformation;
//         }

//         field(2; Media1; Media)
//         {
//             DataClassification = OrganizationIdentifiableInformation;
//         }

//         field(3; MediaSet1; MediaSet)
//         {
//             DataClassification = OrganizationIdentifiableInformation;
//         }

//         field(4; Blob; Blob)
//         {
//             DataClassification = OrganizationIdentifiableInformation;
//             Subtype = Bitmap;
//         }
//     }

//     keys
//     {
//         key(Key1; Code)
//         {
//             Clustered = true;
//         }
//     }
// }

// page 50103 "MediaFactbox"
// {
//     Caption = 'Caption';
//     PageType = CardPart;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = MediaSetExample;

//     layout
//     {
//         area(Content)
//         {
//             field(Media1; Rec.Media1)
//             {
//                 ApplicationArea = All;
//             }
//             field(MediaSet1; Rec.MediaSet1)
//             {
//                 ApplicationArea = All;
//             }
//             field(Blob1; Rec.Blob)
//             {
//                 ApplicationArea = All;
//             }
//         }
//     }
// }

// page 50100 "MediaSetExampleList"
// {
//     ApplicationArea = All;
//     Caption = 'MediaSetExampleList';
//     PageType = List;
//     SourceTable = MediaSetExample;
//     UsageCategory = Lists;
//     CardPageId = MediaSetExampleCard;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field(MyField; Rec.Code)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the MyField field.';
//                 }
//                 field(Media1; Rec.Media1)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Media1 field.';
//                 }
//                 field(MediaSet1; Rec.MediaSet1)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the MediaSet1 field.';
//                 }
//                 field("Blob"; Rec."Blob")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Blob field.';
//                 }
//             }
//         }

//         area(FactBoxes)
//         {
//             part(MediaFactbox; MediaFactbox)
//             {
//                 ApplicationArea = all;
//                 SubPageLink = Code = field(Code);
//             }
//         }
//     }
// }

// page 50101 "MediaSetExampleCard"
// {
//     Caption = 'MediaSetExampleCard';
//     PageType = Card;
//     SourceTable = MediaSetExample;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Code"; Rec."Code")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the MyField field.';
//                 }
//                 field(Media1; Rec.Media1)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Media1 field.';
//                 }
//                 field(MediaSet1; Rec.MediaSet1)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the MediaSet1 field.';
//                 }
//                 field("Blob"; Rec."Blob")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Blob field.';
//                 }
//             }
//         }

//         area(FactBoxes)
//         {
//             part(MediaFactbox; MediaFactbox)
//             {
//                 ApplicationArea = all;
//                 SubPageLink = Code = field(Code);
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(ImportMedia)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Import Media';
//                 Image = Import;

//                 trigger OnAction()
//                 var
//                     FromFileName: Text;
//                     InStreamPic: Instream;
//                 begin
//                     if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, InStreamPic) then begin
//                         Rec.Media1.ImportStream(InStreamPic, FromFileName);
//                         Rec.Modify(true);
//                     end;
//                 end;
//             }

//             action(ExportMedia)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Export Media';
//                 Image = Export;

//                 trigger OnAction()
//                 var
//                     TenantMedia: Record "Tenant Media";
//                     InStreamPic: InStream;
//                     ImageLbl: Label '%1_Image.jpg';
//                     FileName: Text;
//                 begin
//                     if not Rec.Media1.HasValue then
//                         exit;

//                     if TenantMedia.Get(Rec.Media1.MediaId) then begin
//                         TenantMedia.CalcFields(Content);
//                         if TenantMedia.Content.HasValue then begin
//                             FileName := StrSubstNo(ImageLbl, Rec.TableCaption);
//                             TenantMedia.Content.CreateInStream(InStreamPic);
//                             DownloadFromStream(InStreamPic, '', '', '', FileName);
//                         end;
//                     end;
//                 end;
//             }

//             action(ImportPicture)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Import MediaSet';
//                 Image = Import;

//                 trigger OnAction()
//                 var
//                     FromFileName: Text;
//                     InStreamPic: Instream;
//                 begin
//                     if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, InStreamPic) then begin
//                         Rec.MediaSet1.ImportStream(InStreamPic, FromFileName);
//                         Rec.Modify(true);
//                     end;
//                 end;

//             }

//             action(ExportMediaSet)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Export MediaSet';
//                 Image = Export;

//                 trigger OnAction()
//                 var
//                     TenantMedia: Record "Tenant Media";
//                     DataCompression: Codeunit "Data Compression";
//                     TempBlob: Codeunit "Temp Blob";
//                     InStreamPic: InStream;
//                     i: Integer;
//                     ImageLbl: Label '%1_Image_%2.jpg';
//                     OutStream: OutStream;
//                     FileName: Text;
//                     ZipFileName: Text;
//                 begin
//                     if Rec.MediaSet1.Count = 0 then
//                         exit;

//                     ZipFileName := 'Images.zip';
//                     DataCompression.CreateZipArchive();
//                     for i := 1 to Rec.MediaSet1.Count do begin
//                         if TenantMedia.Get(Rec.MediaSet1.Item(i)) then begin
//                             TenantMedia.CalcFields(Content);
//                             if TenantMedia.Content.HasValue then begin
//                                 Clear(InStreamPic);
//                                 TenantMedia.Content.CreateInStream(InStreamPic);
//                                 FileName := StrSubstNo(ImageLbl, Rec.TableCaption, i);
//                                 DataCompression.AddEntry(InStreamPic, FileName);
//                             end;
//                         end;
//                     end;
//                     TempBlob.CreateOutStream(OutStream);
//                     DataCompression.SaveZipArchive(OutStream);
//                     TempBlob.CreateInStream(InStreamPic);
//                     DownloadFromStream(InStreamPic, '', '', '', ZipFileName);
//                 end;
//             }
//         }
//     }
// }
