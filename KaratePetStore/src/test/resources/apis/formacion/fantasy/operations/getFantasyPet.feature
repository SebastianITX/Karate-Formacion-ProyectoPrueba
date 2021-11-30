@ignore
Feature: Get a pet in store

Background:
* call read('classpath:apis/formacion/utils/utils.feature')

Scenario: getpet
    * def req = __arg
    * def headers = karate.merge(req.headers || {}, {})
    * url baseUrl
    Given path '/pet/', req.petId
    And headers headers
    And print headers
    # And param languageId = req.params.languageId
    When method GET

* def expectedStatusCode = req.statusCode || responseStatus
* print req.statusCode
* print responseStatus
# * match responseStatus == expectedStatusCode
* assert (responseStatus == expectedStatusCode)

# match response schema in 'test-data' or any object
* def responseContains = req.matchResponse === true && req.responseMatches ? req.responseMatches : responseType == 'json'? {} : ''
* print responseContains
* print response
* match response contains responseContains


#validate nested array: tags
* def tags_EachContains = req.matchResponse === true && req.responseMatchesEach && req.responseMatchesEach.tags ? req.responseMatchesEach.tags : {}
* def tags_Response = response.tags != null ? response.tags : []
* print tags_EachContains
* print tags_Response
* match each tags_Response contains tags_EachContains

#validate literal values
#* match response.category.name == 'Fantasy'

* print response.name
* print req.responseMatchesLiteral.name
* match response.name == req.responseMatchesLiteral.name