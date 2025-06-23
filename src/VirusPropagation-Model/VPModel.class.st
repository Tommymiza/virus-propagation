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
VPModel >> basicInit: humanRatio with: infectedNb [

	<init>
	| infectedPersons safePersons |
	self
		createGridNumberOfRows: 20
		numberOfColumns: 20
		neighbourhood: 8
		closed: true.
	
	self createN: ((cells size * humanRatio) rounded) randomlyLocatedEntities: VPPerson.
	persons do: [ :each | each beSafe ].
	infectedPersons := self selectRandomlyFrom: self persons size: infectedNb.
	infectedPersons do: [ :each | each beInfected ]
	
]

{ #category : 'accessing - entities' }
VPModel >> cells [
	<getterFor: #VPCell>
	^ cells
]

{ #category : 'initialize-release' }
VPModel >> init [
	<init>
	self basicInit: 0.1 with: 1
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
