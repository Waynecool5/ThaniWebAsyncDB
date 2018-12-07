CREATE PROCEDURE [dbo].[GetRedeemProfile]
	@Loc_ID [nvarchar](20),
	@Card [nvarchar](50),
	@Units [decimal](12, 2),
	@UnitType [nvarchar](10)
WITH EXECUTE AS CALLER
AS
BEGIN
	Declare  @timeStamp datetime 
    
	Select @timeStamp= CURRENT_TIMESTAMP

	Select @Card as ptsCustomerNo, @Units as ptsUnits, @UnitType as ptsUnitType, M.Secret_Mlid AS ptsMlid, Cast('00000' as nvarchar(5)) AS ptsPin,
				M.Secret_Code as ptsSecret, dbo.UNIX_TIMESTAMP(@timeStamp) as ptsUnix
	FROM  ThaniStoreCodes AS T INNer JOIN
			MassyApiCodes AS M ON T.Secret_ID = M.Secret_ID
	WHERE (T.Store_Code = @Loc_ID)

END

