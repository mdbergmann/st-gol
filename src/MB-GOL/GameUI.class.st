Class {
	#name : #GameUI,
	#superclass : #Morph,
	#instVars : [
		'grid'
	],
	#category : #'MB-GOL'
}

{ #category : #drawing }
GameUI >> drawOn: aCanvas [
	| gridSize cellSize origin |
	
	aCanvas fillRectangle: (self bounds) color: Color black.
	
	gridSize := grid gridSize.
	cellSize := (self width / gridSize) asInteger.
	origin := self bounds origin.
	
	1 to: gridSize do: [ :row | 
		1 to: gridSize do: [ :col | 
			| x y cellRect |
			x := origin x + ((row-1) * cellSize).
			y := origin y + ((col-1) * cellSize).
			cellRect := x @ y extent: (cellSize-1) @ (cellSize-1).
			aCanvas
				fillRectangle: cellRect
				color:
					((grid isAliveAtRow: row col: col) = 1
						ifTrue: Color red
						ifFalse: Color white)
		]
	]
]

{ #category : #accessing }
GameUI >> grid [
	^ grid
]

{ #category : #accessing }
GameUI >> grid: aGrid [
	grid := aGrid
]

{ #category : #initialization }
GameUI >> initialize [ 
	super initialize.
	grid := Grid newWith: #(#(0))
	
]

{ #category : #'stepping and presenter' }
GameUI >> step [
	grid calcNewGeneration.
	self changed
]

{ #category : #stepping }
GameUI >> stepTime [
 ^ 1000
]
