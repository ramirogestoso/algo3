!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
ReportTest subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:27:36'!
test01ReportForEmptyAccountOnlyHasTheBalance

	| account report |
	
	account := ReceptiveAccount new .
	report := AccountSummary from: account .
	
	self assert: 1 equals: report size .
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:28:15'!
test02ReportForAnAccountHasTheBalanceAndTheTransactions

	| account report |
	
	account := ReceptiveAccount new .
	Deposit register: 50*peso on: account.
	report := AccountSummary from: account .
	
	self assert: 2 equals: report size .
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:29:09'!
test03ReportIncludesAllTypesOfTransaction

	| account account2 report1 report2 |
	
	account := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 30*peso from: account2 to: account.
	
	Transfer amount: 20*peso from: account to: account2.
	
	report1 := AccountSummary from: account .
	report2 := AccountSummary from: account2 .
	
	self assert: report1 includes: 'Deposito por 100 * pesos'.
	self assert: report1 includes: 'Extraccion por 50 * pesos'.
	self assert: report1 includes: 'Entrada por transferencia de 30 * pesos'.
	self deny: (report1 includes: 'Salida por transferencia de 30 * pesos').
	self assert: report2 includes: 'Salida por transferencia de 30 * pesos'.
	
	self assert: report1 includes: 'Salida por transferencia de 20 * pesos'.
	self assert: report2 includes: 'Entrada por transferencia de 20 * pesos'.
	
	self deny: (report1 includes: 'Entrada por transferencia de 20 * pesos').
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:29:36'!
test04ReportIncludesBalance

	| account report |
	
	account := ReceptiveAccount new .
	Deposit register: 50*peso on: account.
	Withdraw register: 40*peso on: account .
	report := AccountSummary from: account .
	
	self assert: report includes: 'Balance = 10 * pesos'
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'rg 6/13/2022 20:07:00'!
test05ReportForPortfolioIncludesHisChildrenTransactions

	| account account2 portfolio report |
	
	account := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	portfolio := Portfolio new .
	
	portfolio add: account .
	portfolio add: account2 .
	Deposit register: 50*peso on: account.
	Withdraw register: 40*peso on: account2 .
	report := AccountSummary from: portfolio .
	
	self assert: report includes: 'Deposito por 50 * pesos'.
	self assert: report includes: 'Extraccion por 40 * pesos'.
! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
ReportTest subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:17:46'!
test01ReportIncludesBalanceWithASpace


	| johnsAccount report |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan' .
	
	

	
	report := PortfolioDetailedTreePrinter from: johnsAccount .
	
	self assert: report includes: 'Cuenta de Juan' .

	self assert: report includes: ' Balance = 0 * pesos' .! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:20:36'!
test02ReportIncludesATransactionWithASpace


	| johnsAccount report |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan' .
	
	Deposit register: 50*peso on: johnsAccount .

	report := PortfolioDetailedTreePrinter from: johnsAccount .
	
	self assert: report includes: 'Cuenta de Juan' .
	
	self assert: report includes: ' Deposito por 50 * pesos'.
! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:18:22'!
test03ReportIncludesPortfolio


	| johnsPortfolio report |
	
	johnsPortfolio := Portfolio named: 'Portafolio de Juan' .
	
	

	
	report := PortfolioDetailedTreePrinter from: johnsPortfolio .
	
	self assert: report includes: 'Portafolio de Juan' .

	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:18:45'!
test04ReportIncludesPortfolioBalanceWithASpace


	| johnsPortfolio report |
	
	johnsPortfolio := Portfolio named: 'Portafolio de Juan' .
	
	

	
	report := PortfolioDetailedTreePrinter from: johnsPortfolio .
	
	self assert: report includes: 'Portafolio de Juan' .

	self assert: report includes: ' Balance = 0 * pesos' .! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:20:20'!
test05ReportCanHandleMultipleLevelsOfSpaces

	| johnsAccount report angiesAccount childrenPortfolio familyPortfolio myAccount auxiliaryAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	auxiliaryAccount := ReceptiveAccount new.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	Deposit register: 50*peso on: myAccount .
	Withdraw register: 150*peso on: myAccount .
	
	Deposit register: 550*peso on: johnsAccount .
	Withdraw register: 1150*peso on: johnsAccount .
	
	Transfer amount: 1200*peso from: angiesAccount to: auxiliaryAccount .
	
	
	
	report := PortfolioDetailedTreePrinter from: familyPortfolio .
	
	self assert: report includes: 'Portfolio de la familia'.
	self assert: report includes: ' Cuenta mia'.
	self assert: report includes: '  Deposito por 50 * pesos'.
	self assert: report includes: '  Extraccion por 150 * pesos'.
	self assert: report includes: '  Balance = -100 * pesos'.
	self assert: report includes: ' Portfolio de hijos'.
	self assert: report includes: '  Cuenta de Juan'.
	self assert: report includes: '   Deposito por 550 * pesos'.
	self assert: report includes: '   Extraccion por 1150 * pesos'.
	self assert: report includes: '   Balance = -600 * pesos'.
	self assert: report includes: '  Cuenta de Angeles'.
	self assert: report includes: '   Salida por transferencia de 1200 * pesos'.
	self assert: report includes: '   Balance = -1200 * pesos'.
	self assert: report includes: '  Balance = -1800 * pesos'.
	self assert: report includes: ' Balance = -1900 * pesos' .


! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
ReportTest subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:15:28'!
test01ReportIncludesAccountsName
	| johnsAccount report |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan' .
	
	report := PortfolioTreePrinter from: johnsAccount .
	
	self assert: report includes: 'Cuenta de Juan' .
	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:16:09'!
test02SpacesAreBeignUsedProperlyWithAChildrenAccount
	| johnsAccount report portfolio |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan' .
	portfolio := Portfolio named: 'Portafolio familiar' with: johnsAccount .
	
	report := PortfolioTreePrinter from: portfolio .
	
	self assert: report includes: ' Cuenta de Juan' .
	self assert: report includes: 'Portafolio familiar' .
	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:17:00'!
test03ReportUsesSpacesForGranchildAccountsAndChildrenPortfolio
	| johnsAccount report angiesAccount childrenPortfolio familyPortfolio myAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	report := PortfolioTreePrinter from: familyPortfolio .
	
	self assert: report includes: 'Portfolio de la familia' .
	self assert: report includes: ' Cuenta mia' .
	self assert: report includes: ' Portfolio de hijos' .
	self assert: report includes: '  Cuenta de Juan' .
	self assert: report includes: '  Cuenta de Angeles' .
	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'bq 6/15/2022 20:17:28'!
test04ReportMantainsHierarchyOrder
	| johnsAccount report childrenPortfolio familyPortfolio myAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	report := PortfolioTreePrinter from: familyPortfolio .
	
	self assert: (report at: 1) equals: 'Portfolio de la familia' .
	self assert: (report at: 2) equals: ' Cuenta mia' .
	self assert: (report at: 3) equals: ' Portfolio de hijos' .
	self assert: (report at: 4) equals: '  Cuenta de Juan' .
	
	
	! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
ReportTest subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:33:10'!
test01ReportTransferNetForEmptyAccountIsZero



	| account report |
	
	account := ReceptiveAccount new .
	report := TransferNet from: account .
	
	self assert: (report isTransferNet: 0*peso).
! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:32:20'!
test02ReportTransferNetConsidersTransferenceOperations



	| account account2 report |
	
	account := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	
	Transfer amount: 10*peso from: account to: account2.
	Transfer amount: 30*peso from: account2 to: account.
	
	report := TransferNet from: account .
	
	self assert: (report isTransferNet: 20*peso).

! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:32:58'!
test03ReportTransferNetDoesntConsiderTransactionsThatAreNotTransferences



	| account account2 report |
	
	account := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	
	Transfer amount: 10*peso from: account to: account2.
	Transfer amount: 30*peso from: account2 to: account.
	Deposit register: 30*peso on: account .
	Withdraw register: 30000*peso on: account .
	
	
	report := TransferNet from: account .
	
	self assert: (report isTransferNet: 20*peso).
! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'rg 6/13/2022 20:10:49'!
test04ReportTransferNetConsidersAllPortfolioChildren



	| account account2 report portfolio|
	
	account := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	
	Transfer amount: 10*peso from: account to: account2.
	Transfer amount: 30*peso from: account2 to: account.
	portfolio := Portfolio new.
	portfolio add: account.
	portfolio add: account2.

	report := TransferNet from: portfolio.
	
	self assert: (report isTransferNet: 0*peso).

! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'rg 6/13/2022 20:21:05'!
name
	^name! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'rg 6/13/2022 20:17:51'!
initializeNamed: anAccountName 
	name := anAccountName ! !


!Account methodsFor: 'report' stamp: 'rg 6/13/2022 20:50:42'!
addToReport: aReport
	self subclassResponsibility ! !

!Account methodsFor: 'report' stamp: 'bq 6/15/2022 19:24:23'!
distanceToRootParent

	^self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'rg 6/13/2022 20:17:25'!
named: anAccountName
	^self new initializeNamed: anAccountName ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'rgrg 6/12/2022 18:57:32'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'report' stamp: 'rg 6/13/2022 20:54:13'!
addChildrenToReport: aReport 
	accounts do: [ :anAccount | anAccount addToReport: aReport ]! !

!Portfolio methodsFor: 'report' stamp: 'rg 6/13/2022 20:52:25'!
addToReport: aReport
	aReport addPortfolio: self
	! !

!Portfolio methodsFor: 'report' stamp: 'bq 6/15/2022 19:27:59'!
distanceToRootParent

	(parents isEmpty) ifFalse: [^1 + parents first distanceToRootParent ].
	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'rg 6/13/2022 20:25:55'!
named: aName  with: anAccount

	^self new initializeNamed: aName ;
		add: anAccount;
		
		
		
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'rg 6/13/2022 20:25:02'!
named: aName with: anAccount with: anotherAccount

	^self new initializeNamed: aName ;
		add: anAccount;
		add: anotherAccount;
		
		
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'bq 6/15/2022 19:15:00'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	
	parents := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'rgrg 6/12/2022 18:57:25'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'bq 6/15/2022 19:16:14'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'bq 6/15/2022 19:14:44'!
addedTo: aPortfolio 

	parents add: aPortfolio .
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'bq 6/15/2022 19:15:24'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!ReceptiveAccount methodsFor: 'report' stamp: 'rg 6/13/2022 20:51:42'!
addToReport: aReport
	aReport addReceptiveAccount: self .! !

!ReceptiveAccount methodsFor: 'report' stamp: 'bq 6/15/2022 19:28:15'!
distanceToRootParent
	


	(parents isEmpty) ifFalse: [^1 + parents first distanceToRootParent ].
	^0! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'bq 6/12/2022 19:38:36'!
addToReport: aReport
	aReport add: (self behaviourForReport )! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report' stamp: 'bq 6/12/2022 19:42:09'!
behaviourForReport: aReport
	self subclassResponsibility .! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'bq 6/15/2022 20:22:40'!
behaviourForReport: aReport 
	^aReport procedureForDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'rgrg 6/12/2022 18:53:11'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'rgrg 6/12/2022 18:53:11'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'report' stamp: 'bq 6/15/2022 20:22:45'!
behaviourForReport: aReport 
	^aReport procedureForTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'report' stamp: 'bq 6/15/2022 20:22:50'!
behaviourForReport: aReport 
	^aReport procedureForTransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'bq 6/15/2022 20:22:54'!
behaviourForReport: aReport 
	^aReport procedureForWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'private' stamp: 'bq 6/15/2022 20:28:50'!
calculateSpaces: anAccount
	| tamaño espacios |
	tamaño := anAccount distanceToRootParent.
	espacios := ''.
	tamaño timesRepeat: [espacios := espacios , ' '].
	^espacios! !


!Report methodsFor: 'initialization' stamp: 'bq 6/12/2022 19:36:19'!
initializeFor: anAccount
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'as yet unclassified' stamp: 'bq 6/12/2022 19:08:53'!
from: anAccount 
	^self new initializeFor: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'reports'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'private' stamp: 'rgrg 6/12/2022 18:58:26'!
messageForBalance: balanceValue
	^'Balance = ', balanceValue asString! !


!AccountSummary methodsFor: 'initialization' stamp: 'bq 6/12/2022 19:42:10'!
initializeFor: anAccount
	| transactions |
	transactions := anAccount transactions .
	reports := OrderedCollection new .
	transactions do: [ :aTransaction |
		reports add: (aTransaction behaviourForReport: self)
		] .
	reports add: (self messageForBalance: anAccount balance )! !


!AccountSummary methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:25:55'!
procedureForDeposit: aDeposit
	^'Deposito por ', aDeposit value asString! !

!AccountSummary methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:25:48'!
procedureForTransferDepositLeg: aDepositTransferLeg
	^'Entrada por transferencia de ', aDepositTransferLeg value asString! !

!AccountSummary methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:25:35'!
procedureForTransferWithdrawLeg: aWithdrawTransferLeg
	^'Salida por transferencia de ', aWithdrawTransferLeg value asString! !

!AccountSummary methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:25:12'!
procedureForWithdraw: aWithdraw
	^'Extraccion por ', aWithdraw value asString! !


!AccountSummary methodsFor: 'detailed tree printer' stamp: 'bq 6/15/2022 19:52:24'!
beAddedTo: aReportList
	aReportList addAll: reports.! !

!AccountSummary methodsFor: 'detailed tree printer' stamp: 'bq 6/15/2022 19:54:50'!
reportsCollect: aBlock
	reports := reports collect: aBlock
! !


!AccountSummary methodsFor: 'accessing' stamp: 'rgrg 6/12/2022 18:36:31'!
includes: aReportMessage
	^reports includes: aReportMessage ! !

!AccountSummary methodsFor: 'accessing' stamp: 'rgrg 6/12/2022 18:34:16'!
size
	^reports size! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'reports'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'procedures for accounts' stamp: 'bq 6/15/2022 20:29:24'!
addPortfolio: aPortfolio

	| espacios |
	espacios := self calculateSpaces: aPortfolio .

	reports add: espacios , aPortfolio name.
	
	aPortfolio addChildrenToReport: self .
	
	
	
	
	reports add: espacios, ' Balance = ', aPortfolio balance asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'procedures for accounts' stamp: 'bq 6/15/2022 20:29:29'!
addReceptiveAccount: aReceptiveAccount
	| espacios resumenDeCuenta |
	espacios := self calculateSpaces: aReceptiveAccount .
	reports add: 	espacios , aReceptiveAccount name.
	
	resumenDeCuenta := AccountSummary from: aReceptiveAccount .

	espacios := espacios ,' '.
	
	resumenDeCuenta reportsCollect: [:aReport | espacios , aReport ].
	
	resumenDeCuenta beAddedTo: reports.
	! !


!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'bq 6/15/2022 19:40:40'!
initializeFor: anAccount
	reports := OrderedCollection new.
	anAccount addToReport: self .! !


!PortfolioDetailedTreePrinter methodsFor: 'accessing' stamp: 'bq 6/15/2022 19:53:24'!
includes: anAccountName
	^reports includes: anAccountName! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'reports'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'procedures for accounts' stamp: 'bq 6/15/2022 19:35:27'!
addPortfolio: aPortfolio
	reports add: (	self calculateSpaces: aPortfolio) , aPortfolio name.
	
	aPortfolio addChildrenToReport: self .
	! !

!PortfolioTreePrinter methodsFor: 'procedures for accounts' stamp: 'bq 6/15/2022 19:35:27'!
addReceptiveAccount: aReceptiveAccount
	reports add: 	(self calculateSpaces: aReceptiveAccount) , aReceptiveAccount name.! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'rg 6/13/2022 20:47:16'!
initializeFor: anAccount
	reports := OrderedCollection new.
	anAccount addToReport: self .
	"reports add: anAccount name.
	(anAccount isKindOf: Portfolio) ifTrue: [anAccount children do: [ :aChildren | reports add: aChildren name] .]."
		
	! !




!PortfolioTreePrinter methodsFor: 'accessing' stamp: 'bq 6/15/2022 19:32:55'!
at: aNumber
	^reports at: aNumber .! !

!PortfolioTreePrinter methodsFor: 'accessing' stamp: 'rg 6/13/2022 20:40:31'!
includes: anAccountName
	^reports includes: anAccountName! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'accessing' stamp: 'bq 6/12/2022 19:18:18'!
isTransferNet: anAmmountOfPesos
	^anAmmountOfPesos = net .! !


!TransferNet methodsFor: 'initialization' stamp: 'bq 6/12/2022 19:42:10'!
initializeFor: anAccount
	| transactions  |
	transactions := anAccount transactions .

	
		net := transactions sum:
		 [ :transaction | transaction behaviourForReport: self ] ifEmpty: [0*peso].
		
	! !


!TransferNet methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:24:48'!
procedureForDeposit: aDeposit
	^0*peso.! !

!TransferNet methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:24:39'!
procedureForTransferDepositLeg: aDepositTransferLeg
	^aDepositTransferLeg value.! !

!TransferNet methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:24:15'!
procedureForTransferWithdrawLeg: aWithdrawTransferLeg
	^aWithdrawTransferLeg value negated.! !

!TransferNet methodsFor: 'procedures for transactions' stamp: 'bq 6/15/2022 20:24:51'!
procedureForWithdraw: aWithdraw
	^0*peso! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
