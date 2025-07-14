Class {
	#name : 'Recovered',
	#superclass : 'PersonStatus',
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'initialization' }
Recovered >> initialize [
	super initialize.
	name := #Recovered.
	color := Color fromHexString: '#03fc8c'
]

{ #category : 'as yet unclassified' }
Recovered >> nextStatus: aPerson [
	^ Susceptible new
]
