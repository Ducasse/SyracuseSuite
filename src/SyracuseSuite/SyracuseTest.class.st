Class {
	#name : #SyracuseTest,
	#superclass : #TestCase,
	#category : #SyracuseSuite
}

{ #category : #tests }
SyracuseTest >> testAllTermsFrom [

	self assert: (SyracuseSuite new allTermsFrom: 8) equals: #(4 2 1).
	self assert: (SyracuseSuite new allTermsFrom: 16) equals: #(8 4 2 1).
	self assert: (SyracuseSuite new allTermsFrom: 15) equals: #(46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1).
	
]

{ #category : #tests }
SyracuseTest >> testAltitude [

	self assert: (SyracuseSuite new altitudeFor: 8) equals: 4.
	self assert: (SyracuseSuite new altitudeFor: 16) equals: 8.
	self assert: (SyracuseSuite new altitudeFor: 15) equals: 160.
	
]

{ #category : #tests }
SyracuseTest >> testFlight [

	self assert: (SyracuseSuite new flightFor: 8) equals: #(4 2 1) size.
	self assert: (SyracuseSuite new flightFor: 16) equals: 4.
	self assert: (SyracuseSuite new flightFor: 15) equals: 17.
	
]

{ #category : #tests }
SyracuseTest >> testTermAt [

	self assert: (SyracuseSuite termAt: 8) equals: 4.
	self assert: (SyracuseSuite termAt: 5) equals: 16.
	self assert: (SyracuseSuite termAt: 16) equals: 8.
	self assert: (SyracuseSuite termAt: 15) equals: 46.	
]
