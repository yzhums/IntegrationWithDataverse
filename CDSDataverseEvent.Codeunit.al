codeunit 50100 CDSDataverseEvent
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    begin
        if BCTableNo = DATABASE::"Lab Book" then begin
            CDSTableNo := DATABASE::"CDS cr703_LabBook";
            handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    begin
        if CRMTableID = Database::"CDS cr703_LabBook" then
            Handled := LookupCDSLabBook(SavedCRMId, CRMId, IntTableFilter);
    end;

    local procedure LookupCDSLabBook(SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        CDSLabBook: Record "CDS cr703_LabBook";
        OriginalCDSLabBook: Record "CDS cr703_LabBook";
        OriginalCDSLabBookList: Page "CDS Lab Book List";
    begin
        if not IsNullGuid(CRMId) then begin
            if CDSLabBook.Get(CRMId) then
                OriginalCDSLabBookList.SetRecord(CDSLabBook);
            if not IsNullGuid(SavedCRMId) then
                if OriginalCDSLabBook.Get(SavedCRMId) then
                    OriginalCDSLabBookList.SetCurrentlyCoupledCDSLabBook(OriginalCDSLabBook);
        end;

        CDSLabBook.SetView(IntTableFilter);
        OriginalCDSLabBookList.SetTableView(CDSLabBook);
        OriginalCDSLabBookList.LookupMode(true);
        if OriginalCDSLabBookList.RunModal = ACTION::LookupOK then begin
            OriginalCDSLabBookList.GetRecord(CDSLabBook);
            CRMId := CDSLabBook.cr703_LabBookId;
            exit(true);
        end;
        exit(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', true, true)]
    local procedure HandleOnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    begin
        AddEntityTableMapping('labbook', DATABASE::"CDS cr703_LabBook", TempNameValueBuffer);
    end;

    local procedure AddEntityTableMapping(CRMEntityTypeName: Text; TableID: Integer; var TempNameValueBuffer: Record "Name/Value Buffer" temporary)
    begin
        TempNameValueBuffer.Init();
        TempNameValueBuffer.ID := TempNameValueBuffer.Count + 1;
        TempNameValueBuffer.Name := CopyStr(CRMEntityTypeName, 1, MaxStrLen(TempNameValueBuffer.Name));
        TempNameValueBuffer.Value := Format(TableID);
        TempNameValueBuffer.Insert();
    end;

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'CDS');
    end;

    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CDSLabBook: Record "CDS cr703_LabBook";
        LabBook: Record "Lab Book";
    begin
        InsertIntegrationTableMapping(
            IntegrationTableMapping, 'LabBook',
            DATABASE::"Lab Book", DATABASE::"CDS cr703_LabBook", CDSLabBook.FieldNo(cr703_LabBookId), CDSLabBook.FieldNo(ModifiedOn), '', '', true);

        InsertIntegrationFieldMapping('LabBook', LabBook.FieldNo("No."), CDSLabBook.FieldNo(cr703_No), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('LabBook', LabBook.FieldNo(Title), CDSLabBook.FieldNo(cr703_Title), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('LabBook', LabBook.FieldNo(Author), CDSLabBook.FieldNo(cr703_Author), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('LabBook', LabBook.FieldNo(Hardcover), CDSLabBook.FieldNo(cr703_Hardcover), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('LabBook', LabBook.FieldNo("Page Count"), CDSLabBook.FieldNo(cr703_PageCount), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;
}