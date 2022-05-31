!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:18'!
test01MarsRoverThatDoesntRecieveCommandsDoesntMove

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.

self assert: marsrover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:22'!
test02MarsRoverMovesFoward

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'f'.
self assert:  marsrover position equals: 0@1.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:25'!
test03MarsRoverMovesFowardManyTimes

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'ff'.

self assert:  marsrover position equals: 0@2.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:30'!
test04MarsRoverMovesBackwardsAndFowards

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'bf'.

self assert:  marsrover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:33'!
test05MarsRoverTurnsLeftAndMovesFoward

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'lf'.

self assert:  marsrover position equals: -1@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:25:36'!
test06MarsRoverMovesFowardWhileTurningLeftAndEndsInTheStartingPoint

| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'flflflf'.

self assert:  marsrover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:26:40'!
test07MarsRoverMovesBackwardsWhileTurningRightAndEndsInTheStartingPoint

| marsrover |
marsrover _ MarsRover initializeIn: 2@0 facing: East new.
marsrover inputCommand: 'brbrbrb'.

self assert:  marsrover position equals: 2@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:36:38'!
test08MarsRoverThatOnlyRevievesInvalidCommandsDoesNothing
| marsrover |
marsrover _ MarsRover initializeIn: 2@0 facing: East new.
marsrover inputCommand: 'q'.

self assert:  marsrover position equals: 2@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:36:49'!
test09MarsRoverIgnoresInvalidCommands
| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'ffq'.

self assert:  marsrover position equals: 0@2.! !

!MarsRoverTest methodsFor: 'test' stamp: 'bq 5/31/2022 20:35:34'!
test10MarsRoverHaltsWhenRecievingInvalidCommand
| marsrover |
marsrover _ MarsRover initializeIn: 0@0 facing: North new.
marsrover inputCommand: 'ffqflfblfrlflblrlfblrfffffffffffffffff'.

self assert:  marsrover position equals: 0@2.! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direction methodsFor: 'moving' stamp: 'bq 5/31/2022 20:15:53'!
directionVector
	self subclassResponsibility .! !


!Direction methodsFor: 'turning' stamp: 'bq 5/31/2022 20:14:36'!
directionToMyLeft
	self subclassResponsibility .! !

!Direction methodsFor: 'turning' stamp: 'bq 5/31/2022 20:14:41'!
directionToMyRight
	self subclassResponsibility .! !


!classDefinition: #East category: 'MarsRover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'turning' stamp: 'bq 5/31/2022 20:18:53'!
directionToMyLeft
	^North new! !

!East methodsFor: 'turning' stamp: 'bq 5/31/2022 20:19:09'!
directionToMyRight
	^South new.! !


!East methodsFor: 'moving' stamp: 'bq 5/31/2022 20:23:37'!
directionVector
	^ 1@0.! !


!classDefinition: #North category: 'MarsRover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'turning' stamp: 'bq 5/31/2022 20:19:23'!
directionToMyLeft
	^West new.! !

!North methodsFor: 'turning' stamp: 'bq 5/31/2022 20:19:30'!
directionToMyRight
	^East new.! !


!North methodsFor: 'moving' stamp: 'bq 5/31/2022 20:23:13'!
directionVector
	^ 0@1.! !


!classDefinition: #South category: 'MarsRover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'turning' stamp: 'bq 5/31/2022 20:19:44'!
directionToMyLeft
	^East new.! !

!South methodsFor: 'turning' stamp: 'bq 5/31/2022 20:19:52'!
directionToMyRight
	^West new.! !


!South methodsFor: 'moving' stamp: 'bq 5/31/2022 20:23:23'!
directionVector
	^ 0@-1.! !


!classDefinition: #West category: 'MarsRover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'turning' stamp: 'bq 5/31/2022 20:20:26'!
directionToMyLeft
	^South new.! !

!West methodsFor: 'turning' stamp: 'bq 5/31/2022 20:20:34'!
directionToMyRight
	^North new.! !


!West methodsFor: 'moving' stamp: 'bq 5/31/2022 20:23:44'!
directionVector
	^ -1@0.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initializing' stamp: 'bq 5/31/2022 20:51:00'!
initializeIn: aPosition facing: aDirection
	position := aPosition .
	direction  := aDirection .! !


!MarsRover methodsFor: 'turning' stamp: 'bq 5/31/2022 20:50:36'!
turnLeft
	direction := direction directionToMyLeft .! !

!MarsRover methodsFor: 'turning' stamp: 'bq 5/31/2022 20:50:36'!
turnRight
	direction := direction directionToMyRight .! !


!MarsRover methodsFor: 'moving' stamp: 'bq 5/31/2022 20:50:36'!
goBackwards
	
	
	position := position - direction directionVector .! !

!MarsRover methodsFor: 'moving' stamp: 'bq 5/31/2022 20:50:36'!
goFoward
	position := position + direction directionVector .! !


!MarsRover methodsFor: 'private' stamp: 'bq 5/31/2022 20:33:35'!
isInvalidCharacter: aCharacter
	^ ('lrfb' includes: aCharacter) not! !

!MarsRover methodsFor: 'private' stamp: 'bq 5/31/2022 20:49:25'!
performCommand: aCharacter

	aCharacter = $f ifTrue: [self goFoward].
	aCharacter = $b ifTrue: [self goBackwards].
	aCharacter = $l ifTrue: [self turnLeft. ].
	aCharacter = $r ifTrue: [self turnRight .]! !


!MarsRover methodsFor: 'testing' stamp: 'bq 5/31/2022 19:21:32'!
position
	^position.! !


!MarsRover methodsFor: 'commanding' stamp: 'bq 5/31/2022 20:46:53'!
inputCommand: aString 
	
	aString collect: [ :aCharacter | 
		(self isInvalidCharacter: aCharacter) ifTrue: [^self].
		self performCommand: aCharacter.
		]. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'bq 5/31/2022 20:51:18'!
initializeIn: aPosition facing: aDirection
	^self new initializeIn: aPosition facing: aDirection .! !
