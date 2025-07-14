Class {
	#name : 'VPModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'persons',
		'virus'
	],
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'as yet unclassified' }
VPModel class >> aboutThisModel [

	^ ''
]

{ #category : 'as yet unclassified' }
VPModel class >> prefix [

	^ 'VP'
]

{ #category : 'as yet unclassified' }
VPModel >> basicInitLarge: human with: infectedNb [
	| infectedPersons safePersons |
	self
		createGridNumberOfRows: 50
		numberOfColumns:50
		neighbourhood: 8
		closed: true.
	
	self createN: human randomlyLocatedEntities: VPPerson.
	infectedPersons := self selectRandomlyFrom: self persons size: infectedNb.
	infectedPersons do: [ :each | each state: Infected new ]
	
]

{ #category : 'as yet unclassified' }
VPModel >> basicInitSmall: human with: infectedNb [
	| infectedPersons safePersons |
	self
		createGridNumberOfRows: 7
		numberOfColumns: 7
		neighbourhood: 8
		closed: true.
	
	self createN: human randomlyLocatedEntities: VPPerson.
	infectedPersons := self selectRandomlyFrom: self persons size: infectedNb.
	infectedPersons do: [ :each | each state: Infected new ]
	
]

{ #category : 'accessing - entities' }
VPModel >> cells [
	<getterFor: #VPCell>
	^ cells
]

{ #category : 'initialize-release' }
VPModel >> initLarge [
	<init>
	self basicInitLarge: 200 with: 1
]

{ #category : 'initialize-release' }
VPModel >> initSmall [
	<init>
	self basicInitSmall: 20 with: 1
]

{ #category : 'initialization' }
VPModel >> initialize [
	super initialize.
	cells := OrderedCollection new.
	persons := OrderedCollection new
]

{ #category : 'accessing' }
VPModel >> persons [
    <getterFor: #VPPerson>
    ^ persons
]

{ #category : 'stepping' }
VPModel >> step [
	<control>
	persons do: [ :each | each moveRandomly ]
	
]
