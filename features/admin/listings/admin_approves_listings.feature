Feature: Admin sees list of listings

  Background:
    Given there are following users:
      | person |
      | kassi_testperson1 |
      | kassi_testperson2 |
    Given "kassi_testperson1" has admin rights in community "test"

  @javascript
  Scenario: List of listings
    Given community "test" has new order type "Selling2" with action button "Buy"
    And there is a listing with title "car spare parts" from "kassi_testperson2" with category "Items" and with listing shape "Selling2"
    And that listing is pending for admin approval
    And I am logged in as "kassi_testperson1"
    When I go to the listings admin page
    Then I should see "car spare parts" within "#admin_listings"
    And I follow "Pending"
    Then I should see "This listing has not been approved yet." within "#listing-form"
    And I press "Approve"
    Then I should see "Open" within "#admin_listings"

