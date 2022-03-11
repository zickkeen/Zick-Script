SELECT [POSID]
		,[POSTitle]
		,[POSActive]
		-- Number of Copies
		,[CopyClosedBill]
		,[CopyPrePrintBill]
		,[CopyReprintBill]
		,[CopyAllVoidBill]
		,[CopyXreport]
		,[CopyZreport]
		-- Receipt Layout
		--,[Rcpt_Header1] --MCI
        --,[Rcpt_Header2] --MCI
        ,[Rcpt_Header3]
		,[Rcpt_Header4]
		,[Rcpt_Header5]
		,[Rcpt_Header6]
        ,[Rcpt_Footer1]
        ,[Rcpt_Footer2]
        ,[Rcpt_Footer3]
        ,[Rcpt_Footer4]
        ,[Rcpt_Footer5]
        ,[Rcpt_Footer6]
        ,[Rcpt_Footer7]
        ,[Rcpt_Footer8]
		,[Rcpt_Footer9]
		,[Rcpt_Footer10]
		,[Rcpt_Footer11]
		,[Rcpt_Footer12]
		-- [Left] Printing Preferences v7.2.0
		,[Line1DblSize]
        ,[Line2DblSize]
		,[Line3DblSize]
		,[Line4DblSize]
		,[printBalancePoints]
		,[PrintUnitPrice]
		,[PrintSalesCategory]
		,[printTotalQty]
		,[PrintVoids]
		,[PrintFreeItems] -- Apabila nonAktif [PrintFreePrep] dan [PrintFreePLU] juga nonaktif
		,[PrintFreePrep]
		,[PrintPrepWithPrice]
		,[PrintPrmnSummary] --jika nonaktif, [PromotionSummaryText] juga nonaktif
		,[PromotionSummaryText]
		,[PrintPrmnDtls]
		,[Hotel]
		,[printRounding]
		,[PrintZeroPrice]
		,[printTax]
		,[printTotalTax] --JIka nonaktif, [TotalTaxTitle]=''
		,[TotalTaxTitle]
		,[ordered] --Jika nonaktif, [OrderBy] = ''
        ,[OrderBy] --OrderBy
			-- 1. ItemName (Alphabet)
			-- 2. Department (Department)
			-- 3. GroupNo (Group)
			-- 4. CategoryName (SalesCategory)
		,[PrintVAT]
		,[PrintOfficial]
		-- [Left] Printing Preferences v7.2.0
		,[PrintRcptTitle]
		,[PrintGroup]
		,[PrintDepartment]
		,[ConsolidateMedia]
		,[PrintDeptSubTotal]
		,[PrintGroupSubtotal]
		,[PrintSalesCtgSubTotal]
		,[PrintRental]
		,[PrintFreePLU]
		,[AskNarrative]
        ,[AskNarrativeAmount]
		,[PreRcptDblSize]
        ,[PreRcptComment]
	FROM [POSDtls] WHERE [POSID]='POS001'
	