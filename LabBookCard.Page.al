page 50100 "Lab Book Card"
{
    Caption = 'Lab Book Card';
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Lab Book";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
            }

            group(Details)
            {
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field(Hardcover; Rec.Hardcover)
                {
                    ApplicationArea = All;
                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
