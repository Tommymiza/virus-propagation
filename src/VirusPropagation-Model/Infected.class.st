Class {
	#name : 'Infected',
	#superclass : 'PersonStatus',
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'initialization' }
Infected >> initialize [
	super initialize.
	name := #Infected.
	color := Color fromHexString: '#fc1803'
]

{ #category : 'as yet unclassified' }
Infected >> nextStatus: aPerson [
	^ Recovered new
]
