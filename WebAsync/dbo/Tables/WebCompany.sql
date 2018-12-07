CREATE TABLE [dbo].[WebCompany] (
    [webComp_ID]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [webName]      NVARCHAR (100) NULL,
    [webAddress]   NVARCHAR (500) NULL,
    [webContact]   NVARCHAR (50)  NULL,
    [webEmail]     NVARCHAR (100) NULL,
    [webTel]       NVARCHAR (50)  NULL,
    [webCustomsID] NVARCHAR (20)  NULL,
    [webVAT]       NVARCHAR (20)  NULL,
    [webDEC]       NVARCHAR (20)  NULL,
    [webISOCty]    NVARCHAR (2)   NULL,
    [webActive]    BIT            NULL,
    CONSTRAINT [PK_WebCompany] PRIMARY KEY CLUSTERED ([webComp_ID] ASC)
);

