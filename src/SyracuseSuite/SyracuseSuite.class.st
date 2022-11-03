"
```
SyracuseSuite new 
	termAt: 15 
> 46
```

```
SyracuseSuite new 
	allTermsFrom: 15 
> #(46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1)
```
```
SyracuseSuite new 
	termAt: 46 
> 23
```
```
SyracuseSuite new 
	allTermsFrom: 19 
> #(58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
```
```
SyracuseSuite new 
	allTermsFrom: 200
> #(100 50 25 76 38 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
```


```
SyracuseSuite new 
	allTermsFrom: 2000 
> #(1000 500 250 125 376 188 94 47 142 71 214 107 322 161 484 242 121 364 182 91 274 137 412 206 103 310 155 466 233 700 350 175 526 263 790 395 1186 593 1780 890 445 1336 668 334 167 502 251 754 377 1132 566 283 850 425 1276 638 319 958 479 1438 719 2158 1079 3238 1619 4858 2429 7288 3644 1822 911 2734 1367 4102 2051 6154 3077 9232 4616 2308 1154 577 1732 866 433 1300 650 325 976 488 244 122 61 184 92 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1) #(1000 500 250 125 376 188 94 47 142 71 214 107 322 161 484 242 121 364 182 91 274 137 412 206 103 310 155 466 233 700 350 175 526 263 790 395 1186 593 1780 890 445 1336 668 334 167 502 251 754 377 1132 566 283 850 425 1276 638 319 958 479 1438 719 2158 1079 3238 1619 4858 2429 7288 3644 1822 911 2734 1367 4102 2051 6154 3077 9232 4616 2308 1154 577 1732 866 433 1300 650 325 976 488 244 122 61 184 92 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1)
```

```
SyracuseSuite new 
	picInAllFrom: 20 
> #(15 160)
```
```
SyracuseSuite new 
	picInAllFrom: 200 
>#(27 9232)
```
"
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
	"Return the max and its index in all the syracuse paths from 1 to anInteger."
	
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
