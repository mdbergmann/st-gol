"
A RulesTest is a test class for testing the behavior of Rules
"
Class {
	#name : #RulesTest,
	#superclass : #TestCase,
	#category : #'MB-GOL-Tests'
}

{ #category : #tests }
RulesTest >> testIsAliveWithAliveState [
	self assert: (Rules isAlive: 1 neighbours: 1) equals: 0.
	self assert: (Rules isAlive: 1 neighbours: 2) equals: 1.
	self assert: (Rules isAlive: 1 neighbours: 3) equals: 1.
	self assert: (Rules isAlive: 1 neighbours: 4) equals: 0

]

{ #category : #tests }
RulesTest >> testIsAliveWithDeadState [
	self assert: (Rules isAlive: 0 neighbours: 2) equals: 0.
	self assert: (Rules isAlive: 0 neighbours: 3) equals: 1.
	self assert: (Rules isAlive: 0 neighbours: 4) equals: 0
]
