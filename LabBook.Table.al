table 50100 "Lab Book"
{
    Caption = 'Lab Book';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Title; Text[30])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Author; Text[30])
        {
            Caption = 'Author';
            DataClassification = CustomerContent;
        }
        field(4; Hardcover; Boolean)
        {
            Caption = 'Hardcover';
            DataClassification = CustomerContent;
        }
        field(5; "Page Count"; Integer)
        {
            Caption = 'Page Count';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}