test - parsing middleware
testStrictUnknownContentTypeParsing
	
	| response |
	
	app settings forceCorrectContentDecoding: true.
	
	response := RPTestHelper put: '/index' on: app headers: (Dictionary newFrom: {'Content-Type' -> 'test/unknown'}) content: ''.
	self assert: (app parsedRequestContents) equals: nil.
	self assert: response body equals: app settings badRequestPage.
	self assert: app indexHandlerCalled equals: false.
	
	response := RPTestHelper post: '/index' on: app headers: (Dictionary newFrom: {'Content-Type' -> 'test/unknown'}) content: ''.
	self assert: (app parsedRequestContents) equals: nil.
	self assert: response body equals: app settings badRequestPage.
	self assert: app indexHandlerCalled equals: false.