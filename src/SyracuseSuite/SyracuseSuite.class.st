Class {
	#name : #SyracuseSuite,
	#superclass : #Object,
	#category : #SyracuseSuite
}

{ #category : #accessing }
SyracuseSuite class >> termAt: aNumber [

	^ self new termAt: aNumber 
]

{ #category : #accessing }
SyracuseSuite >> allTermsFrom: aNumber [
	"Returns all the terms up to 1 of aNumber"

	| current |
	current := aNumber.
	^ Array streamContents: [ :ar |
		[ current = 1 ] whileFalse: [ 
			current := self termAt: current.
			ar nextPut: current
			]
		 ]
]

{ #category : #accessing }
SyracuseSuite >> altitudeFrom: aNumber [

	^ (self allTermsFrom: aNumber) max

	
]

{ #category : #accessing }
SyracuseSuite >> flightFor: aNumber [

	^ (self allTermsFrom: aNumber) size

	
]

{ #category : #compute }
SyracuseSuite >> picInAllFrom: anInteger [ 
	
	| currentAlt max indexOfMax |
	max := 1.
	indexOfMax := 0.
	2 to: anInteger do: [ :i|
		currentAlt := self altitudeFrom: i.
		
		max < currentAlt ifTrue: [
			max := currentAlt.
			indexOfMax := i.
		 ]].
	^ { indexOfMax . max }
	
	
]

{ #category : #accessing }
SyracuseSuite >> termAt: aNumber [
	"Returns the syracuse term for a given number."
	
	^ (aNumber rem: 2) isZero
		ifTrue: [ aNumber / 2 ]
		ifFalse: [ aNumber * 3 + 1 ]
	
]
