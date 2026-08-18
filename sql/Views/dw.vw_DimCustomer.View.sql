CREATE VIEW  dw.vw_DimCustomer AS
SELECT [CustomerKey]

      ,[Status]
      ,[LeadSource]
      ,[CreatedDate]
  FROM [dw].[DimCustomer]
