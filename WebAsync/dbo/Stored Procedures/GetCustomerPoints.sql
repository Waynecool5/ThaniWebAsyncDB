CREATE PROCEDURE [dbo].[GetCustomerPoints]
	@ID [int] = -1,
	@XMode [int] = 0
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @XMode = 0 
	begin
		SELECT * FROM  Points
	End
	Else
	Begin
    	SELECT *
		FROM   Points
		WHERE  (Points_id = @id)
	End

END
