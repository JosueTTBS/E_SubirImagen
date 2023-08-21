table 50300 "MediaSetExample"
{
    DataClassification = OrganizationIdentifiableInformation;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; Media1; Media)
        {
            DataClassification = OrganizationIdentifiableInformation;
        }

        field(3; MediaSet1; MediaSet)
        {
            DataClassification = OrganizationIdentifiableInformation;
        }

        field(4; Blob; Blob)
        {
            DataClassification = OrganizationIdentifiableInformation;
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}
