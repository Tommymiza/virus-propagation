Class {
	#name : 'Susceptible',
	#superclass : 'PersonStatus',
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'initialization' }
Susceptible >> initialize [
	super initialize.
	name := #Susceptible.
	color := Color fromHexString: '#f8fc03'
]

{ #category : 'as yet unclassified' }
Susceptible >> nextStatus: aPerson [
	| neighbour neighbourInfected |
	neighbour := aPerson patch neighbourhood select: [ :cell | cell hasPerson ] thenCollect: [
		:cell |
		cell getPerson
	].
	neighbourInfected := neighbour select: [ :person | person state name = #Infected ].
	neighbourInfected isEmpty ifTrue: [ 
		^ self
	] ifFalse: [
		^ Exposed new
	]
]
