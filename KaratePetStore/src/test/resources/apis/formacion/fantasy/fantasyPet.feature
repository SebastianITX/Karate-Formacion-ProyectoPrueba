Feature: Some Scenario Outlines for pet API

Background:
    * def getInput = read('input/getInput.json')

@GetPet
Scenario Outline: Get Case: we get the pets previously added
    * def req = call utils.readTestData <testDataFile>
    * def result = call read('operations/getFantasyPet.feature') req
    * print <status>
    * match result.responseStatus == <status>
        Examples:
        | getInput |

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


@PutPet
Scenario Outline: Put Case: we update the pets previously added
    * def req = call utils.readTestData <testDataFile>
    * def result = call read('operations/putFatasyPet.feature') req
    * match result.responseStatus == <status>
        Examples:
        | read('input/putInput.json') |
