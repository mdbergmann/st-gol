"
A GridTest is a test class for testing the behavior of Grid
"
Class {
	#name : #GridTest,
	#superclass : #TestCase,
	#category : #'MB-GOL-Tests'
}

{ #category : #tests }
GridTest >> testNeighbourCount [
	| cut testGrid |
	testGrid := #(	#(0 1 0)
						#(1 0 1)
						#(0 0 1) ).
	cut := Grid newWith: testGrid.
	self assert: (cut neighbourCountAtRow: 1 atCol: 1) equals: 2.
	self assert: (cut neighbourCountAtRow: 1 atCol: 2) equals: 2.
	self assert: (cut neighbourCountAtRow: 1 atCol: 3) equals: 2.
	self assert: (cut neighbourCountAtRow: 2 atCol: 1) equals: 1.
	self assert: (cut neighbourCountAtRow: 2 atCol: 2) equals: 4.
	self assert: (cut neighbourCountAtRow: 2 atCol: 3) equals: 2.
	self assert: (cut neighbourCountAtRow: 3 atCol: 1) equals: 1.
	self assert: (cut neighbourCountAtRow: 3 atCol: 2) equals: 3.
	self assert: (cut neighbourCountAtRow: 3 atCol: 3) equals: 1.

]

{ #category : #tests }
GridTest >> testNewGeneration [
	| cut testGrid testGridExpected |	
	testGrid := #(	#(0 0 0)
						#(0 1 0)
						#(0 0 0) ).
	testGridExpected := #(	#(0 0 0)
									#(0 0 0)
									#(0 0 0) ).
	cut := Grid newWith: testGrid.
	cut calcNewGeneration.
	self assert: (cut grid) equals: testGridExpected.
	
]

{ #category : #tests }
GridTest >> testNewGeneration2 [
	| cut testGrid testGridExpected |	
	testGrid := #(	#(0 0 1)
						#(0 1 1)
						#(0 0 0) ).
	testGridExpected := #(	#(0 1 1)
									#(0 1 1)
									#(0 0 0) ).
	cut := Grid newWith: testGrid.
	cut calcNewGeneration.
	self assert: (cut grid) equals: testGridExpected.

]

{ #category : #tests }
GridTest >> testNewGeneration3 [
	| cut testGrid testGridExpected |	
	testGrid := #(	#(0 0 0)
						#(0 1 1)
						#(1 1 1) ).
	testGridExpected := #(	#(0 0 0)
									#(1 0 1)
									#(1 0 1) ).
	cut := Grid newWith: testGrid.
	cut calcNewGeneration.
	self assert: (cut grid) equals: testGridExpected.

]

{ #category : #tests }
GridTest >> testNewGeneration4 [
	| cut testGrid testGridExpected |	
	testGrid := #(	#(0 0 1)
						#(0 0 1)
						#(0 0 1) ).
	testGridExpected := #(	#(0 0 0)
									#(0 1 1)
									#(0 0 0) ).
	cut := Grid newWith: testGrid.
	cut calcNewGeneration.
	self assert: (cut grid) equals: testGridExpected.
]
