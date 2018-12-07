Create PROCEDURE [dbo].[GetVoidProfile]
	@Loc_ID [nvarchar](20),
	@Invoice [nvarchar](50)
WITH EXECUTE AS CALLER
AS
BEGIN
	Declare  @timeStamp datetime 
    
	Select @timeStamp= CURRENT_TIMESTAMP

	Select @Invoice as ptsInvoice, M.Secret_Mlid AS ptsMlid, Cast('00000' as nvarchar(5)) AS ptsPin,
				M.Secret_Code as ptsSecret, dbo.UNIX_TIMESTAMP(@timeStamp) as ptsUnix
	FROM  ThaniStoreCodes AS T INNer JOIN
			MassyApiCodes AS M ON T.Secret_ID = M.Secret_ID
	WHERE (T.Store_Code = @Loc_ID)

END
