CREATE TABLE [dbo].[ThaniStoreCodes] (
    [Store_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Secret_ID]  INT            NULL,
    [Store_Name] NVARCHAR (100) NULL,
    [Store_Code] NVARCHAR (20)  NULL,
    CONSTRAINT [PK_StoreCodes] PRIMARY KEY CLUSTERED ([Store_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ThaniStoreCodes]
    ON [dbo].[ThaniStoreCodes]([Store_Code] ASC);

