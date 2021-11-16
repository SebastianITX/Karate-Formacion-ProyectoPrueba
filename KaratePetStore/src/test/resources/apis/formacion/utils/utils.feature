@ignore
Feature:

Background:
* def environments = read('classpath:apis/formacion/utils/json/env.json')

Scenario:
    * def getUrl =
        """
        function() {
            return environments["petUrl1"]
        }
        """