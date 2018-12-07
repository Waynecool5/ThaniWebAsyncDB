CREATE TABLE [dbo].[MassyApiCodes] (
    [Secret_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Secret_Name] NVARCHAR (50)  NULL,
    [Secret_Code] NVARCHAR (100) NULL,
    [Secret_Mlid] INT            NULL,
    CONSTRAINT [PK_MassyApiCodes] PRIMARY KEY CLUSTERED ([Secret_ID] ASC)
);

