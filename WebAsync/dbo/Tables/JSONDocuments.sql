CREATE TABLE [dbo].[JSONDocuments] (
    [Document_id]       INT            IDENTITY (1, 1) NOT NULL,
    [docPointsJSON]     NVARCHAR (MAX) NULL,
    [docAddresses]      NVARCHAR (MAX) NULL,
    [docCards]          NVARCHAR (MAX) NULL,
    [docEmailAddresses] NVARCHAR (MAX) NULL,
    [docNotes]          NVARCHAR (MAX) NULL,
    [docPhones]         NVARCHAR (MAX) NULL,
    [docTimeStamp]      DATETIME       NULL,
    CONSTRAINT [JSONDocumentsPk] PRIMARY KEY CLUSTERED ([Document_id] ASC)
);

