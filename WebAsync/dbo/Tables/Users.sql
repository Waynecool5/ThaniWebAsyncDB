CREATE TABLE [dbo].[Users] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Firstname] NVARCHAR (50)  NULL,
    [Lastname]  NVARCHAR (50)  NULL,
    [Username]  NVARCHAR (50)  NULL,
    [Password]  NVARCHAR (50)  NULL,
    [Email]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);

