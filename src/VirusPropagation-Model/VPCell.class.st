Class {
	#name : 'VPCell',
	#superclass : 'CMSpatialEntityCell',
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'as yet unclassified' }
VPCell >> getPerson [

	self hasPerson ifFalse: [ self error: 'This cell does not contain person' ].
	^ (self occupantsOfClass: VPPerson) first
]

{ #category : 'testing' }
VPCell >> hasPerson [
	^ self hasOccupantsOfClass: VPPerson
]

{ #category : 'accessing' }
VPCell >> pov [
	<pov>
	| aColor |
	aColor := Color fromHexString: '#807d7d'.
	^ CMPointOfView color: aColor
]
