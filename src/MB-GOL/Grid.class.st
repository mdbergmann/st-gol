Class {
	#name : #Grid,
	#superclass : #Object,
	#instVars : [
		'gridArray'
	],
	#category : #'MB-GOL'
}

{ #category : #'instance creation' }
Grid class >> newWith: aGrid [
	| instance |
	instance := self new.
	instance initWith: aGrid.
	^instance

]

{ #category : #public }
Grid >> calcNewGeneration [
	"Calculates a new generation of the grid and modifies the internal grid array."
	| gridSize |
	gridSize := gridArray size.
	gridArray := (1 to: gridSize)
		collect: [ :rowIndex | 
			(1 to: gridSize)
				collect: [ :colIndex |
					(Rules
						isAlive: ((gridArray at: rowIndex) at: colIndex)
						neighbours: (self neighbourCountAtRow: rowIndex atCol: colIndex))
				]
		]

]

{ #category : #accessing }
Grid >> gridArray [
	^ gridArray
]

{ #category : #accessing }
Grid >> gridArray: aGridArray [
	gridArray := aGridArray
]

{ #category : #'as yet unclassified' }
Grid >> gridSize [
	^gridArray size.
]

{ #category : #initialization }
Grid >> initWith: aGridArray [
	gridArray := aGridArray
	
]

{ #category : #testing }
Grid >> isAliveAtRow: rowIndex col: colIndex [
	^((gridArray at: rowIndex) at: colIndex)
]

{ #category : #'private ' }
Grid >> neighbourCountAtRow: rowIndex atCol: colIndex [
	| count |
	count := 0.
	count := count + (self valueAtRow: rowIndex - 1 atCol: colIndex - 1).
	count := count + (self valueAtRow: rowIndex - 1 atCol: colIndex).
	count := count + (self valueAtRow: rowIndex - 1 atCol: colIndex + 1).
	count := count + (self valueAtRow: rowIndex atCol: colIndex - 1).
	count := count + (self valueAtRow: rowIndex atCol: colIndex + 1).
	count := count + (self valueAtRow: rowIndex + 1 atCol: colIndex - 1).
	count := count + (self valueAtRow: rowIndex + 1 atCol: colIndex).
	count := count + (self valueAtRow: rowIndex + 1 atCol: colIndex + 1).
	^count
	
]

{ #category : #'private ' }
Grid >> valueAtRow: rowIndex atCol: colIndex [
	| gridLen |
	gridLen := gridArray size.
	(rowIndex < 1) | (rowIndex > gridLen)
		ifTrue: [^0].
	(colIndex < 1) | (colIndex > gridLen)
		ifTrue: [^0].
	^(gridArray at: rowIndex) at: colIndex
	
]
