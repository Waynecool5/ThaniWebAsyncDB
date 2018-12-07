CREATE PROCEDURE [dbo].[UpdatePoints]
	@Points [dbo].[PointsTable] READONLY
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT ON;

	--have a list of objects to send to the database
	--you need a user-defined table type and a stored procedure that accepts the table type

	UPDATE Points
	SET ptsCustomerNo = upd.ptsCustomerNo, ptsTotal = upd.ptsTotal, 
		ptsValue = upd.ptsValue, ptsDiscount = upd.ptsDiscount, ptsMode = upd.ptsMode, 
		ptsLocation = upd.ptsLocation
	FROM @Points upd
	WHERE (Points.Points_id = upd.Points_id)



END

