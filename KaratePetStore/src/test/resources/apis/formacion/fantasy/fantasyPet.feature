Feature: Some Scenario Outlines for pet API

Background:

@GetPet
Scenario Outline: Get Case: we get the pets previously added
    * def req = call utils.readTestData <testDataFile>
    * def result = call read('operations/getFantasyPet.feature') req
    * match result.responseStatus == <status>
        Examples:
        | read('input/getInput.json') |

@PostPet
Scenario Outline: Post Case: we add a Pet to the store
    * def req = call utils.readTestData <testDataFile>
    * def result = call read('operations/postFantasyPet.feature') req
    * match result.responseStatus == <status>
        Examples:
        | read('input/postInput.json') |

@GetPet
Scenario Outline: Get Case: we get the pets previously added
    * def req = call utils.readTestData <testDataFile>
    * def result = call read('operations/getFantasyPet.feature') req
    * match result.responseStatus == <status>
        Examples:
        | read('input/getInputPost.json') |
