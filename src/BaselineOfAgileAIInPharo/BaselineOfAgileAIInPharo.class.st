Class {
	#name : #BaselineOfAgileAIInPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfAgileAIInPharo
}

{ #category : #loading }
BaselineOfAgileAIInPharo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'agile-ai-in-pharo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAgileAIInPharo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'AgileAIInPharo'
		]
]
