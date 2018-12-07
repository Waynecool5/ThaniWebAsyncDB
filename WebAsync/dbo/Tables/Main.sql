CREATE TABLE [dbo].[Main] (
    [Main_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [Comp_ID]     INT           NULL,
    [InternalRef] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Main] PRIMARY KEY CLUSTERED ([Main_ID] ASC)
);

