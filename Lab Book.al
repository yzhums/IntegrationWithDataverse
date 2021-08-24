table 50101 "CDS cr703_LabBook"
{
    ExternalName = 'cr703_labbook';
    TableType = CDS;
    Description = '';

    fields
    {
        field(1; cr703_LabBookId; GUID)
        {
            ExternalName = 'cr703_labbookid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Unique identifier for entity instances';
            Caption = 'Lab Book';
        }
        field(2; CreatedOn; Datetime)
        {
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was created.';
            Caption = 'Created On';
        }
        field(4; ModifiedOn; Datetime)
        {
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was modified.';
            Caption = 'Modified On';
        }
        field(24; statecode; Option)
        {
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Status of the Lab Book';
            Caption = 'Status';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 0, 1;
        }
        field(26; statuscode; Option)
        {
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Reason for the status of the Lab Book';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(28; VersionNumber; BigInteger)
        {
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version Number';
            Caption = 'Version Number';
        }
        field(29; ImportSequenceNumber; Integer)
        {
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Sequence number of the import that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(30; OverriddenCreatedOn; Date)
        {
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(31; TimeZoneRuleVersionNumber; Integer)
        {
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(32; UTCConversionTimeZoneCode; Integer)
        {
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(33; cr703_No; Text[100])
        {
            ExternalName = 'cr703_no';
            ExternalType = 'String';
            Description = 'Required name field';
            Caption = 'No.';
        }
        field(34; cr703_Title; Text[30])
        {
            ExternalName = 'cr703_title';
            ExternalType = 'String';
            Description = '';
            Caption = 'Title';
        }
        field(35; cr703_PageCount; Integer)
        {
            ExternalName = 'cr703_pagecount';
            ExternalType = 'Integer';
            Description = '';
            Caption = 'Page Count';
        }
        field(36; cr703_Hardcover; Boolean)
        {
            ExternalName = 'cr703_hardcover';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Hardcover';
        }
        field(38; cr703_Author; Text[30])
        {
            ExternalName = 'cr703_author';
            ExternalType = 'String';
            Description = '';
            Caption = 'Author';
        }
    }
    keys
    {
        key(PK; cr703_LabBookId)
        {
            Clustered = true;
        }
        key(Name; cr703_No)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; cr703_No)
        {
        }
    }
}