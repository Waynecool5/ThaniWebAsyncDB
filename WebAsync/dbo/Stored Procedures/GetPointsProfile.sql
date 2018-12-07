CREATE PROCEDURE [dbo].[GetPointsProfile]
	@Loc_ID [nvarchar](20),
	@Card [nvarchar](50)
WITH EXECUTE AS CALLER
AS
BEGIN
	Declare  @timeStamp datetime 
    
	Select @timeStamp= CURRENT_TIMESTAMP

	SELECT        @Card AS ptsCustomerNo, M.Secret_Mlid AS ptsMlid, CAST('00000' AS nvarchar(5)) AS ptsPin, M.Secret_Code AS ptsSecret, dbo.UNIX_TIMESTAMP(@timeStamp) AS ptsUnix
	FROM            ThaniStoreCodes AS T INNER JOIN
							 MassyApiCodes AS M ON T.Secret_ID = M.Secret_ID
	WHERE        (T.Store_Code = @Loc_ID)

END
