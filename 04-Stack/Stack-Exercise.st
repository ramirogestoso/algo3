!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:07:13'!
test01SentenceFinderByPrefixEmptyReturnsEmptyCollectionOfSentences
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	
	self assert: (sentenceFinder find: 'aPrefix') isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:07:06'!
test02SentenceFinderByPrefixWithOneSentenceFindsItAndItsOk
	| sentenceFinder aSentence |
	
	sentenceFinder := SentenceFinderByPrefix new .
	aSentence := 'aPrefix sentence' .
	sentenceFinder add: aSentence .
	
	self assert: (sentenceFinder find: 'aPrefix') includes: aSentence ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:06:59'!
test03SentenceFinderByPrefixWithOneSentenceNotFindsItButItsOk
	| sentenceFinder aSentence |
	
	sentenceFinder := SentenceFinderByPrefix new .
	aSentence := 'aSufix sentence' .
	sentenceFinder add: aSentence .
	
	self assert: ((sentenceFinder find: 'aPrefix') includes: aSentence) not! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:06:47'!
test04SentenceFinderByPrefixWithManySentencesFindsOnlyOneAndItsOk
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'three senteces ' .
	self assert: (sentenceFinder find: 'two') includes: 'two sentences' . ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:06:39'!
test05SentenceFinderByPrefixWithManySentencesFindsManyAndItsOk
	| sentenceFinder sentencesFound |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	sentencesFound := sentenceFinder find: 'two' .
	#('two sentences' 'two send' 'two added') do: [ :aSentence | self assert: sentencesFound includes: aSentence ] .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'rg 5/12/2022 21:06:19'!
test06SentenceFinderByPrefixWithManySentencesDoesNotFindsAnyAndItsOk
	| sentenceFinder sentencesFound |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	sentencesFound := sentenceFinder find: 'sent' .
	self assert: sentencesFound isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 16:32:25'!
test07SentenceFinderByPrefixWithNilRaisesError
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	
	self should: [sentenceFinder find: nil] raise: Error
	withExceptionDo:  [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 16:33:10'!
test08SentenceFinderByPrefixWithEmptyStringRaisesError
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	
	self should: [sentenceFinder find: ''] raise: Error
	withExceptionDo:  [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 16:36:09'!
test09SentenceFinderByPrefixWithSpaceRaisesError
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	
	self should: [sentenceFinder find: ' '] raise: Error
	withExceptionDo:  [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 16:39:13'!
test10SentenceFinderByPrefixWithSpacesRaisesError
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'one sentence' .
	sentenceFinder add: 'two sentences' .
	sentenceFinder add: 'two send' .
	sentenceFinder add: 'two added' .
	
	
	self should: [sentenceFinder find: '    '] raise: Error
	withExceptionDo:  [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 16:56:17'!
test11SentenceFinderByPrefixWithNilAsStackRaisesError
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new .
	
	self should: [sentenceFinder find: 'aPrefix' inStack: nil] raise: Error - MessageNotUnderstood 
	withExceptionDo:  [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidStackErrorMessage ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'bq 5/15/2022 17:06:49'!
test12SentenceFinderIsCaseSensitive
	| sentenceFinder sentencesFound|
	
	sentenceFinder := SentenceFinderByPrefix new .
	sentenceFinder add: 'One Sentence' .
	sentenceFinder add: 'oNe sentence' .
	sentenceFinder add: 'onE sentence' .
	sentenceFinder add: 'one sentence' .
	
	
	sentencesFound := sentenceFinder find: 'one' .
	self assert: sentencesFound size equals: 1.
	self assert: sentencesFound includes: 'one sentence'.
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'rg 5/12/2022 20:03:11'!
initialize
	stack := OrderedCollection new.
	stack addFirst: OOStackElement newAsBaseOfStack .! !


!OOStack methodsFor: 'accessing' stamp: 'rg 5/12/2022 00:22:57'!
size
	^stack size - 1 .
	! !

!OOStack methodsFor: 'accessing' stamp: 'rg 5/12/2022 00:26:30'!
top
	 ^stack first elementValue! !


!OOStack methodsFor: 'testing' stamp: 'rg 5/12/2022 19:54:43'!
isEmpty
	^stack first isBaseOfStack .! !


!OOStack methodsFor: 'removing' stamp: 'rg 5/12/2022 20:04:36'!
pop	| topElement |
	topElement := self top . "si el primero el elemento base del stack, lanza error aca"
	stack removeFirst .
	^topElement
	! !


!OOStack methodsFor: 'adding' stamp: 'rg 5/12/2022 20:06:02'!
push: anElement
	stack addFirst: (OOStackElement newWithValue: anElement) .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: 'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'testing' stamp: 'rg 5/12/2022 19:53:12'!
isBaseOfStack
	self subclassResponsibility ! !


!OOStackElement methodsFor: 'accessing' stamp: 'rg 5/12/2022 00:29:14'!
elementValue
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackElement class' category: 'Stack-Exercise'!
OOStackElement class
	instanceVariableNames: ''!

!OOStackElement class methodsFor: 'instance creation' stamp: 'rg 5/12/2022 20:03:08'!
newAsBaseOfStack
	^OOStackBaseElement new! !

!OOStackElement class methodsFor: 'instance creation' stamp: 'rg 5/12/2022 20:06:49'!
newWithValue: anObject
	^OOStackNotBaseElement new initializeWithValue: anObject ! !


!classDefinition: #OOStackBaseElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBaseElement methodsFor: 'testing' stamp: 'rg 5/12/2022 19:53:15'!
isBaseOfStack
	^true! !


!OOStackBaseElement methodsFor: 'accessing' stamp: 'rg 5/12/2022 20:00:44'!
elementValue
	self error: OOStack stackEmptyErrorDescription ! !


!classDefinition: #OOStackNotBaseElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackNotBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotBaseElement methodsFor: 'initialization' stamp: 'rg 5/12/2022 20:06:46'!
initializeWithValue: anObject 
	element := anObject.! !


!OOStackNotBaseElement methodsFor: 'accessing' stamp: 'rg 5/12/2022 00:41:13'!
elementValue
	^element ! !


!OOStackNotBaseElement methodsFor: 'testing' stamp: 'rg 5/12/2022 19:53:15'!
isBaseOfStack
	^false ! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'asserting' stamp: 'rg 5/15/2022 18:17:09'!
assertPrefixIsValid: aPrefix
	| invalidPrefixConditions |
	invalidPrefixConditions := { [:prefix | (prefix isKindOf: String) not]. [:prefix | prefix = '']. [:prefix | prefix beginsWith: ' '] } .
	
	invalidPrefixConditions 
		detect: [ :aCondition | aCondition value: aPrefix ] 
		ifFound: [ :condition | self error: self class invalidPrefixErrorMessage ] 
		ifNone: [].
	! !

!SentenceFinderByPrefix methodsFor: 'asserting' stamp: 'rg 5/15/2022 18:14:35'!
assertStackIsValid: aStack
	(aStack isKindOf: OOStack ) ifFalse: [self error: self class invalidStackErrorMessage .].
! !


!SentenceFinderByPrefix methodsFor: 'enumerating' stamp: 'rg 5/15/2022 18:14:57'!
find: aPrefix 
	^self find: aPrefix inStack: stack.! !

!SentenceFinderByPrefix methodsFor: 'enumerating' stamp: 'rg 5/15/2022 18:15:29'!
find: aPrefix inStack: aStack
	self assertPrefixIsValid: aPrefix .
	self assertStackIsValid: aStack .
	
	^self select: [ :aSentence | aSentence beginsWith: aPrefix ] inStack: aStack! !


!SentenceFinderByPrefix methodsFor: 'adding' stamp: 'rg 5/12/2022 20:24:32'!
add: aSentence
	stack push: aSentence! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'rg 5/12/2022 20:25:35'!
initialize
	stack := OOStack new ! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'bq 5/15/2022 16:51:50'!
select: aBlockToSatisfy inStack: aStack
	^(self stackAsCollection: aStack) select: aBlockToSatisfy ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'rg 5/15/2022 18:16:34'!
stackAsCollection: aStack
	| stackAsCollection |
	
	stackAsCollection := OrderedCollection new .
	
	aStack size timesRepeat: [ stackAsCollection add: aStack pop ] .
	
	stackAsCollection reversed do: [ :anElement | aStack push: anElement ] .
	
	^stackAsCollection ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'bq 5/15/2022 16:30:54'!
invalidPrefixErrorMessage
	^'El prefijo es invalido'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'bq 5/15/2022 16:56:48'!
invalidStackErrorMessage
	^'El stack no es valido'! !
