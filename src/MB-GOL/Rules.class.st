Class {
	#name : #Rules,
	#superclass : #Object,
	#category : #'MB-GOL'
}

{ #category : #testing }
Rules class >> isAlive: state neighbours: neighbours [
	^state = 1
		ifTrue: (self isAliveFromAlive: neighbours)
		ifFalse: (self isAliveFromDead: neighbours)

]

{ #category : #testing }
Rules class >> isAliveFromAlive: neighbours [
	^(neighbours = 2) | (neighbours = 3)
		ifTrue: 1
		ifFalse: 0
		
]

{ #category : #testing }
Rules class >> isAliveFromDead: neighbours [
	^neighbours = 3
		ifTrue: 1
		ifFalse: 0
]
