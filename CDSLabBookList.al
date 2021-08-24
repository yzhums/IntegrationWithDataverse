page 50102 "CDS Lab Book List"
{
    Caption = 'CDS Lab Book List';
    PageType = List;
    SourceTable = "CDS cr703_LabBook";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(cr703_No; Rec.cr703_No)
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(cr703_Title; Rec.cr703_Title)
                {
                    Caption = 'Title';
                    ApplicationArea = All;
                }
                field(cr703_Author; Rec.cr703_Author)
                {
                    Caption = 'Author';
                    ApplicationArea = All;
                }
                field(cr703_Hardcover; Rec.cr703_Hardcover)
                {
                    Caption = 'Hardcover';
                    ApplicationArea = All;
                }
                field(cr703_PageCount; Rec.cr703_PageCount)
                {
                    Caption = 'Page Count';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateFromCDS)
            {
                ApplicationArea = All;
                Caption = 'Create in Business Central';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate the table from the coupled Microsoft Dataverse lab book.';

                trigger OnAction()
                var
                    CDSLabBook: Record "CDS cr703_LabBook";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSLabBook);
                    CRMIntegrationManagement.CreateNewRecordsFromCRM(CDSLabBook);
                end;
            }
        }
    }

    var
        CurrentlyCoupledCDSLabBook: Record "CDS cr703_LabBook";

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;

    procedure SetCurrentlyCoupledCDSLabBook(CDSLabBook: Record "CDS cr703_LabBook")
    begin
        CurrentlyCoupledCDSLabBook := CDSLabBook;
    end;
}