Feature: Import purchase file
  As a dude at Living Social
  In order to integrate our backend with that crazy company we bought that stores its data in text files
  I need to import data files and have the data get stored in our database

  Scenario: Import a valid data file
    Given I have a valid data file
    When I import the file
    Then I should see a confirmation message
    And the data from the file should be in our database

  Scenario: Import an invalid data file
    When I import an invalid file
    Then I should see an error message
    And no new data should be in our database