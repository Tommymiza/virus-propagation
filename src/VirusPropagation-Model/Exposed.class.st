Class {
	#name : 'Exposed',
	#superclass : 'PersonStatus',
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'initialization' }
Exposed >> initialize [
	super initialize.
	name := #Exposed.
	color := Color fromHexString: '#fc8403'
]

{ #category : 'as yet unclassified' }
Exposed >> nextStatus: aPerson [
	^ Infected new
]
