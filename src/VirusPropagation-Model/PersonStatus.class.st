Class {
	#name : 'PersonStatus',
	#superclass : 'Object',
	#instVars : [
		'name',
		'color'
	],
	#category : 'VirusPropagation-Model',
	#package : 'VirusPropagation-Model'
}

{ #category : 'testing' }
PersonStatus class >> isAbstract [

	^ self == PersonStatus
]

{ #category : 'accessing' }
PersonStatus >> color [

	^ color
]

{ #category : 'accessing' }
PersonStatus >> color: aColor [

	color := aColor 
]

{ #category : 'accessing' }
PersonStatus >> name [
	^ name
]

{ #category : 'accessing' }
PersonStatus >> name: aStatus [

	name := aStatus
]

{ #category : 'as yet unclassified' }
PersonStatus >> nextStatus: aPerson [
	^ self subclassResponsibility
]
