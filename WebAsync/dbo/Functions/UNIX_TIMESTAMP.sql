CREATE FUNCTION [dbo].[UNIX_TIMESTAMP](@ctimestamp [datetime])
RETURNS [int] WITH EXECUTE AS CALLER
AS 
BEGIN
  /* Function body */
  declare @return integer

  SELECT @return = DATEDIFF(SECOND,{d '1970-01-01'}, @ctimestamp)

  return @return
END
