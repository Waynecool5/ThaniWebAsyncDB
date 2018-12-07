CREATE TABLE [dbo].[Registration] (
    [Reg_ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Comp_ID]         NVARCHAR (10)  NULL,
    [Comp_Name]       NVARCHAR (100) NULL,
    [Comp_Address]    NVARCHAR (200) NULL,
    [Comp_Country]    NVARCHAR (50)  NULL,
    [Comp_CtyAbb]     NVARCHAR (2)   NULL,
    [Comp_VAT]        NVARCHAR (20)  NULL,
    [Comp_ImpNo]      NVARCHAR (20)  NULL,
    [Comp_DecNo]      NVARCHAR (20)  NULL,
    [Comp_VISA]       NVARCHAR (50)  NULL,
    [Comp_Expire]     DATETIME       NULL,
    [Comp_CreateDate] DATETIME       NULL,
    [Comp_Owner]      NVARCHAR (50)  NULL,
    [Comp_Email]      NVARCHAR (50)  NULL,
    [Comp_Password]   NVARCHAR (50)  NULL,
    [Comp_Active]     INT            NULL,
    CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED ([Reg_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Registration]
    ON [dbo].[Registration]([Comp_ID] ASC, [Comp_CtyAbb] ASC, [Comp_VAT] ASC, [Comp_Name] ASC, [Comp_Active] ASC, [Comp_Password] ASC, [Comp_VISA] ASC);

