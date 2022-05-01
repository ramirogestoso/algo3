!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerAlreadyExists category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerAlreadyExists
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerCanNotBeEmpty category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerCanNotBeEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:30:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook aBlock| 
	customerBook := CustomerBook new.
	aBlock := [customerBook addCustomerNamed: 'John Lennon'.].
	self assert: (Chronometer timeToExecute: aBlock isLessThan: (50 * millisecond))
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:30:57'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney aBlock|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	aBlock := [customerBook removeCustomerNamed: paulMcCartney].
	customerBook addCustomerNamed: paulMcCartney.
	self assert: (Chronometer timeToExecute: aBlock isLessThan:(100 * millisecond ))
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:10:39'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self should: [ customerBook addCustomerNamed: ''.] raise: CustomerCanNotBeEmpty .
	"No hace falta checkear el mensaje que envia el error, ya que el should:raise: solo acepta un tipo de error ahora"
	self assert: customerBook isEmpty! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:10:54'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [customerBook removeCustomerNamed: 'Paul McCartney'.] raise: NotFound .
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon)
		
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:11:07'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [customerBook suspendCustomerNamed: 'Ringo Starr'.] raise: CantSuspend .
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bq 5/1/2022 18:11:23'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon.] raise: CantSuspend .
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon)
! !


!classDefinition: #Chronometer category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Chronometer
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Chronometer class' category: 'CodigoRepetido-Ejercicio'!
Chronometer class
	instanceVariableNames: ''!

!Chronometer class methodsFor: 'as yet unclassified' stamp: 'bq 5/1/2022 18:31:26'!
timeToExecute: aBlock isLessThan: anAmmountOfTime

	| millisecondsAfter millisecondsBefore 	|
	
	millisecondsBefore := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfter := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfter-millisecondsBefore) < anAmmountOfTime .! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'bq 5/1/2022 18:07:37'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ CustomerCanNotBeEmpty signal ].
	(self includesCustomerNamed: aName) ifTrue: [ CustomerAlreadyExists signal].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'bq 5/1/2022 18:08:57'!
numberOfCustomers
	
	
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'bq 5/1/2022 17:14:43'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal.]].
	
	
	
	

	
	

! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !
