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

{ #category : 'initialization' }
VPPerson >> initialize [
	super initialize.
	state := Susceptible new
]

{ #category : 'as yet unclassified' }
VPPerson >> moveRandomly [
	<action>
	self randomWalkConstrainedBy: [ :cell | (cell hasOccupants) not ].
	self state: (self state nextStatus: self)
]

{ #category : 'accessing' }
VPPerson >> pov [
	<pov>
	^ CMPointOfView color: state color
]

{ #category : 'accessing' }
VPPerson >> state [

	^ state
]

{ #category : 'accessing' }
VPPerson >> state: aStatus [
	state := aStatus
]
