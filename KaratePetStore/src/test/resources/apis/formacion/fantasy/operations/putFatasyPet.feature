@ignore
Feature: Puts a pet in store

Background:


Scenario: postPet
    * def req = __arg
    * def headers = karate.merge(req.headers || {}, {})
    * url baseUrl
    Given path '/pet', req.petId
    And headers headers
    And request req.body
    When method PUT

* def expectedStatusCode = req.statusCode || responseStatus
* match responseStatus == expectedStatusCode

# match response schema in 'test-data' or any object
* def responseContains = req.matchResponse === true && req.responseMatches ? req.responseMatches : responseType == 'json'? {} : ''
* match response contains responseContains

#validate nested array: tags
* def tags_EachContains = req.matchResponse === true && req.responseMatchesEach && req.responseMatchesEach.tags ? req.responseMatchesEach.tags : {}
* def tags_Response = response.tags
* match each tags_Response contains tags_EachContains
