Class {
	#name : 'VPPerson',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'state'
	],
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'as yet unclassified' }
VPPerson >> beInfected [
	self state: #isInfected
]

{ #category : 'as yet unclassified' }
VPPerson >> beSafe [
	self state: #isSafe
]

{ #category : 'as yet unclassified' }
VPPerson >> contaminPersons [
	| neighbour |
	neighbour := self patch neighbourhood select: [ :cell | cell hasPerson ] thenDo: [
		:cell |
		cell getPerson beInfected
	]
	
]

{ #category : 'testing' }
VPPerson >> isInfected [
	^ self state = #isInfected
]

{ #category : 'testing' }
VPPerson >> isSafe [
	^ self state = #isSafe
]

{ #category : 'as yet unclassified' }
VPPerson >> moveRandomly [
	<action>
	self randomWalkConstrainedBy: [ :cell | (cell hasOccupants) not ].
	self isInfected ifTrue: [ self contaminPersons ]
]

{ #category : 'accessing' }
VPPerson >> pov [
	<pov>
	| aColor |
	aColor := Color fromHexString: '#dbdbdb'.
	self isSafe ifTrue: [ aColor := Color fromHexString: '#3cff19' ].
	self isInfected ifTrue: [ aColor := Color fromHexString: '#ff1c1c' ].
	^ CMPointOfView color: aColor
]

{ #category : 'accessing' }
VPPerson >> state [

	^ state
]

{ #category : 'accessing' }
VPPerson >> state: aStatus [
	state := aStatus
]
