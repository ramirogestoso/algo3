!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:19:45'!
test01

	| portfolio account1 account2 | 
	
	portfolio := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	
	Deposit register: 50*peso on: account1 .
	Deposit register: 100*peso on: account2 .
	
	portfolio add: account1 .
	portfolio add: account2 .
	
	self assert: 150*peso equals: portfolio balance .
	! !

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:20:54'!
test02

	| portfolio account1 account2 transacc1 transacc2 | 
	
	portfolio := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	
	transacc1 := Deposit register: 0*peso on: account1 .
	transacc2 := Deposit register: 100*peso on: account2 .
	
	portfolio add: account1 .
	portfolio add: account2 .
	
	self assert: (portfolio hasRegistered: transacc1) .
	self assert: (portfolio hasRegistered: transacc2 ).
	! !

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:20:58'!
test03

	| portfolio account1 account2 transactions | 
	
	portfolio := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	transactions := OrderedCollection new .
	
	transactions add: (Deposit register: 10*peso on: account1) .
	transactions add: (Deposit register: 100*peso on: account2) .
	
	portfolio add: account1 .
	portfolio add: account2 .
	
	self assert: (portfolio transactions includesAllOf: transactions ) .
	
	! !

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:21:05'!
test04

	| portfolio1 portfolio2 account1 account2 account3 | 
	
	portfolio1 := Portfolio new .
	portfolio2 := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	account3 := ReceptiveAccount new .
	
	Deposit register: 10*peso on: account1 .
	Deposit register: 100*peso on: account2 .
	Deposit register: 1000*peso on: account3 .
	
	portfolio1 add: account1 .
	portfolio1 add: account2 .
	portfolio2 add: account3.
	portfolio2 add: portfolio1 .
	
	self assert: 1110*peso equals: portfolio2 balance.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:21:10'!
test05

	| portfolio1 portfolio2 account1 account2 account3 transacc | 
	
	portfolio1 := Portfolio new .
	portfolio2 := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	account3 := ReceptiveAccount new .
	
	transacc := Deposit register: 10*peso on: account1 .
	Deposit register: 100*peso on: account2 .
	Deposit register: 1000*peso on: account3 .
	
	portfolio1 add: account1 .
	portfolio1 add: account2 .
	portfolio2 add: account3.
	portfolio2 add: portfolio1 .
	
	self assert: (portfolio2 hasRegistered: transacc ).! !

!PortfolioTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:21:18'!
test06

	| portfolio1 portfolio2 account1 account2 account3 transacciones | 
	
	portfolio1 := Portfolio new .
	portfolio2 := Portfolio new .
	account1 := ReceptiveAccount new .
	account2 := ReceptiveAccount new .
	account3 := ReceptiveAccount new .
	transacciones := OrderedCollection new .
	
	transacciones add: (Deposit register: 10*peso on: account1) .
	transacciones add: (Deposit register: 100*peso on: account2) .
	transacciones add: (Deposit register: 1000*peso on: account3) .
	
	portfolio1 add: account1 .
	portfolio1 add: account2 .
	portfolio2 add: account3.
	portfolio2 add: portfolio1 .
	
	self assert: (portfolio2 transactions includesAllOf: transacciones ) .
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:18:05'!
test01
	| account account2 |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new .
	Deposit register: 50 * peso on: account.
	
	Transfer for: 50*peso from: account to: account2.
	
	self assert: account balance equals: 0*peso.
	self assert: account2 balance equals: 50*peso .! !

!TransferTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:18:34'!
test02
	| account account2 transfer |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new .
	Deposit register: 50 * peso on: account.
	
	transfer := Transfer for: 50*peso from: account to: account2.
	
	self assert: 50*peso equals: transfer value .! !

!TransferTest methodsFor: 'test' stamp: 'rg 6/6/2022 21:18:55'!
test03
	| account account2 transfer |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new .
	Deposit register: 50 * peso on: account.
	
	transfer := Transfer for: 50*peso from: account to: account2.
	self assert: (transfer deposit isCounterpart: transfer withdraw).
	self assert: (transfer withdraw isCounterpart: transfer deposit).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'initialization' stamp: 'rg 6/6/2022 21:23:59'!
initializeFor: aValue 

	value := aValue ! !


!AccountTransaction methodsFor: 'value' stamp: 'rg 6/6/2022 21:23:34'!
impactToBalance: aBalance
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'rg 6/6/2022 21:23:12'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'rg 6/6/2022 21:22:23'!
for: aValue

	^ self new initializeFor: aValue! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'as yet unclassified' stamp: 'rg 6/2/2022 21:40:15'!
impactToBalance: aBalance
	^aBalance + self value! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #TransferDeposit
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'bq 6/5/2022 17:18:54'!
isCounterpart: aWithdraw
	^counterpart = aWithdraw ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'bq 6/5/2022 17:17:14'!
setCounterpart: aWithdraw
	counterpart := aWithdraw .! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'as yet unclassified' stamp: 'rg 6/2/2022 21:40:35'!
impactToBalance: aBalance
	^aBalance - self value! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #TransferWithdraw
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'rg 6/6/2022 21:14:40'!
isCounterpart: aTransactionDeposit 
	^counterpart = aTransactionDeposit ! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'bq 6/5/2022 17:16:42'!
setCounterpart: aDeposit
	counterpart := aDeposit .! !


!classDefinition: #Entity category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Entity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Entity methodsFor: 'as yet unclassified' stamp: 'bq 6/6/2022 23:40:01'!
balance
	^self subclassResponsibility ! !

!Entity methodsFor: 'as yet unclassified' stamp: 'bq 6/6/2022 23:41:19'!
hasRegisteder
	^self subclassResponsibility ! !

!Entity methodsFor: 'as yet unclassified' stamp: 'bq 6/6/2022 23:40:53'!
register: algo
	^self subclassResponsibility ! !

!Entity methodsFor: 'as yet unclassified' stamp: 'bq 6/6/2022 23:41:05'!
transfers
	^self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Entity subclass: #Portfolio
	instanceVariableNames: 'cuentasYPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'rg 6/6/2022 21:25:35'!
initialize
	cuentasYPortfolios := Set new .! !


!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:42:22'!
add: anAccountOrPortfolio 



	self assert1: anAccountOrPortfolio 
	self assert2: anAccountOrPortfolio 
	self assert3: anAccountOrPortfolio 
	self assert4: anAccountOrPortfolio 
	self assert5: anAccountOrPortfolio 

	cuentasYPortfolios add: anAccountOrPortfolio ! !

!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:55:30'!
assert1: anAccountOrPortfolio

	"self deny: (cuentasYPortfolios includes: anAccountOrPortfolio ). "
	"reemplazar por msg polimorfico que tambien checkee en porfolios hijos para el assert2"! !

!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:46:42'!
assert2: anAccountOrPortfolio

	"ver en assert1"! !

!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:55:36'!
assert3: anAccountOrPortfolio

	"self deny: (self = anAccountOrPortfolio )"! !

!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:55:21'!
assert4: anAccountOrPortfolio

"para este hace falta que cada portfolio sepa su padre, un metodo escala hasta encontrar el portfolio padre del resto, que tiene a nil de padre y hacerle assert1(o 2) a ese"

	"self encontrarPadre assert1."! !

!Portfolio methodsFor: 'main protocol' stamp: 'bq 6/6/2022 23:54:39'!
assert5: anAccountOrPortfolio

	"
	
	cuentasYPortfolios anySatisfy: [ :cosa | anAccountOrPortfolio devolverCuentasYPortfoliosHijos includes: cosa]."
	
! !

!Portfolio methodsFor: 'main protocol' stamp: 'rg 6/6/2022 21:27:13'!
balance
	^cuentasYPortfolios sum: [ :accountOrPortfolio | accountOrPortfolio balance ]  ifEmpty: [0]! !

!Portfolio methodsFor: 'main protocol' stamp: 'rg 6/6/2022 21:27:19'!
hasRegistered: aTransaction 
	^cuentasYPortfolios anySatisfy: [ :accountOrPortfolio | accountOrPortfolio hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'rg 6/6/2022 21:27:25'!
transactions
	| collection | 
	collection := OrderedCollection new .
	cuentasYPortfolios collect: [ :accountOrPortfolio | collection addAll: accountOrPortfolio transactions ] .
	^collection ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Entity subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'rg 6/2/2022 21:39:48'!
balance

	^ transactions inject: 0 into: [ :balance :aTransaction |  aTransaction impactToBalance: balance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
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


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value acountOfPesos deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'accessing' stamp: 'rg 6/6/2022 21:05:53'!
deposit
	^deposit! !

!Transfer methodsFor: 'accessing' stamp: 'rg 6/6/2022 21:02:04'!
value
	^value! !

!Transfer methodsFor: 'accessing' stamp: 'rg 6/6/2022 21:06:11'!
withdraw
	^withdraw! !


!Transfer methodsFor: 'initialization' stamp: 'rg 6/6/2022 21:08:53'!
initializeFor: anAcountOfPesos deposit: aDeposit andWithdraw: aWithdraw   
	deposit := aDeposit .
	withdraw := aWithdraw .
	value := anAcountOfPesos.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'rg 6/6/2022 21:15:25'!
for: anAcountOfPesos from: aSenderAccount to: aReceptiveAccount
	| deposito retiro |
	
	deposito _ TransferDeposit register: anAcountOfPesos on: aReceptiveAccount .
	retiro _ TransferWithdraw register: anAcountOfPesos on: aSenderAccount .
	
	self linkDeposit:  deposito andWithdraw: retiro.
	
	^self new initializeFor: anAcountOfPesos deposit: deposito andWithdraw: retiro .! !

!Transfer class methodsFor: 'instance creation' stamp: 'bq 6/5/2022 17:15:58'!
linkDeposit: aDeposit andWithdraw: aWithdraw

	aDeposit setCounterpart: aWithdraw .
	aWithdraw  setCounterpart: aDeposit .! !
