@module=bagCartSPMobile
Feature: Bag and Cart SP Mobile
Description: This feature uses Bag and Cart to verify 

@id=1 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Add product to cart from product details page as guest user
	Given User access <brand> website
#	When User searches on mobile with keyword as <item>
#	And User clicks on product on mobile
#	And User chooses random size
#	And User selects the quantity on mobile and sets it to <firstquantity>
#	And User clicks add to bag
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
	Then User verifies title on product page matches item on cart page
	
	Examples:
	| brand  | item     | firstquantity |
	| SPEEDO | 7750130  | 1             |
	
@id=3 @positive @parallel @cart_module @cart  @brand=SPMobile @mobile
Scenario Outline: Verify searching and adding an item to cart from cart page as guest user
	Given User access <brand> website
#	When User searches on mobile with keyword as <product> 
#	And User clicks on product on mobile
#	And User chooses random size
#	And User selects the quantity on mobile and sets it to <firstquantity>
#	And User clicks add to bag
#	And User goes to cart page
#	When User searches on mobile with keyword as <secondProduct> 
#	And User clicks on product on mobile
#	And User chooses random size
#	And User selects the quantity on mobile and sets it to <firstquantity>
#	And User clicks add to bag
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
    And User searches on mobile another <product> with style number and adds it to cart
	Then User should verify that both items are in bag

	Examples:
	| brand  | item     | product | firstquantity |   
	| SPEEDO | 7530331  | 7750130 | 1             | 
	
@id=4 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Add quantity of product from cart page as guest user
	Given User access <brand> website
#	When User searches for <product> 
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
	And User adjusts the quantity on mobile to <secondquantity>
	Then User verifies title on product page matches item on cart page

	Examples:
	| brand  | item    | firstquantity | secondquantity |
	| SPEEDO | 7750130 | 1             | 3              |
	
@id=5 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Removing 1 product as guest user when cart has more than 1 product as guest user
	Given User access <brand> website
#	When User searches for <product> 
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
#	And User searches a second item <secondProduct> and adds that to the bag
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
    And User searches on mobile an <item> with style number and adds it to cart
    And User searches on mobile another <product> with style number and adds it to cart
	And User removes the second item
	Then User verifies title on product page matches item on cart page

	Examples:
	| brand  | item    | product | firstquantity |  
	| SPEEDO | 7750130 | 7530331 | 1             |


@id=7 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Add product with size and quantity selection then choose to edit product in cart and verify user is navigated to Product Page
	Given User access <brand> website
	When User searches on mobile with keyword as <item>
	And User chooses random size
	And User selects the quantity on mobile and sets it to <quantity>
	And User clicks add to bag
	And User goes to cart page
	And User selects to edits product to on mobile cart
#	Then User verifies user is on product page
	
	Examples:
	| brand  | item      | quantity |
	| SPEEDO | 7734147   | 1        |


@id=11 @negative @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Apply invalid promo code as guest user
	Given User access <brand> website
#	When User searches for <product> 
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <quantity> and adds it to bag
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
	And User applies promo <code>
	Then User should get promo error message <text>
	
	Examples:
	| brand  | item    | quantity | code    | text                                 |
	| SPEEDO | 7750130 | 1        | ABCDEFG | Promotion code "ABCDEFG" is invalid. |

#@id=12 @positive @parallel @cart_module
#Scenario Outline: Verify applying valid promo code which is applicable to more then 1 item in cart as guest user
#	Given User access <brand> website
#	And User add <item> to cart
#    And User add <secondItem> to cart
#    And User applies promo <code>
#    Then User verifies promo code added for multiple items <code>
#    
#    @brand=CKUS
#    Examples:
#    | brand | item     | secondItem | code   |
#    | CKUS  | 11599403 | 12866431   | FALL20 |
#
#    @brand=TH
#    Examples: 
#    | brand | item    | secondItem | code      |
#    | TH    | UU00003 | 78C4161    | CCP2B61QF |
#
#    @cart
#    Examples:
#    | brand  | item    | secondItem | code  | 
#    | SPEEDO | 7719727 |  8051504   | LTF25 |

#@id=13 @positive @parallel @cart_module
#Scenario Outline: Veriy removing applied promo code from cart as guest user
#	Given User access <brand> website
#	And User add <item> to cart
#	And User applies promo <code>
#	Then User verifies that removing promo code removes discount <code>
#
#	@brand=CKUS
#    Examples:
#    | brand | item     | secondItem | code   |
#    | CKUS  | 11599403 | 12866431   | FALL20 |
#
#	@brand=TH
#    Examples: 
#    | brand | item    | secondItem | code      |
#    | TH    | UU00003 | 78C4161    | CCP2B61QF |
#	
#	@cart
#    Examples:
#    | brand  | item    | secondItem | code  | 
#    | SPEEDO | 7719727 |  8051504   | LTF25 |
	
@id=15 @negative @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Add product without selecting a size
	Given User access <brand> website
	When User searches on mobile with keyword as <item>
	And User adds item to bag
	Then User verifies user is prompted to select a size
		
	Examples:
	| brand  | item     |
	| SPEEDO | 7734147  |

@id=16 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Remove 1 product from cart as guest user when cart has only 1 product as guest user
	Given User access <brand> website
#	When User searches on mobile with keyword as <product>
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity on mobile and sets it to <quantity>
#	And User clicks add to bag
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
	And User removes all items in cart
	Then User verifies that the cart is empty
	
	Examples:
	| brand  | item    |
	| SPEEDO | 7750130 |
	 
#@id=17 @positive @parallel @cart_module @cart  @brand=SPMobile @mobile
#Scenario Outline: Reduce quantity of product from cart page as guest user
#	Given User access <brand> website
#	When User searches for <product> 
#	And User clicks on product
##	And User chooses random size
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
#	And User goes to cart page
#	And User adjusts the quantity to <secondquantity>
#	Then User verifies title on product page matches item on cart page
	
#	Examples:
#	| brand  | item     | firstquantity | secondquantity |
#	| SPEEDO | 7750130  | 3             | 1              |	
	
@id=18 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Verify products added as a guest user are prevalent in the cart upon signing in
	Given User access <brand> website
#	When User searches on mobile with keyword as <product>
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity on mobile and sets it to <quantity>
#	And User clicks add to bag
    And User searches on mobile an <item> with style number and adds it to cart
	When User navigate to mobile login page
	And User try to login using <email> and <password>
	Then User should be login successfully
	And User goes to cart page
	Then User verifies title on product page matches item on cart page
	And User removes all items in cart
	
	Examples:
	| brand  | item     | email                       | password | secondItem  | quantity |
	| SPEEDO | 7750130  | myaccountspeedo43@gmail.com | Passw0rd | shorts      | 1        |
	
#@id=19 @positive @parallel @cart_module @cart
#Scenario Outline: Add product as guest user to cart then add quantity as signed in user
#	Given User access <brand> website
#	When User searches for <product>
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
#	When User navigate to login page
#	And User try to login using <email> and <password>
#	And User goes to cart page
#	And User adjusts the quantity to <secondquantity>
#	Then User verifies title on product page matches item on cart page
#	And User removes all items in cart
		
#	Examples:
#	| brand	 | email                      | password | product  | firstquantity | secondquantity |
#	| SPEEDO | myaccountspeedo4@gmail.com | Passw0rd | flippers | 1             | 3              |

#@id=20 @negative @parallel @cart_module @cart
#Scenario Outline: Add more than 5 quantity of product with less than 5 quantity available on cart page
#	Given User access <brand> website
#	When User searches for <product> 
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <firstquantity> and adds it to bag
#	And User goes to cart page
#	And User adjusts the quantity of <secondquantity> without checking stock
#	Then User verifies <error> quantity not available
	
#	Examples:
#	| brand  | product | firstquantity | secondquantity |
#	| SPEEDO | 7720728 | 1             | 40             |

#@id=21 @positive @parallel @cart_module @cart
#Scenario Outline: Add multiple items to cart as guest user and remove one item as signed in user
#	Given User access <brand> website
#	And User add <item> to cart
#	And User searches a second item <secondItem> and adds that to the bag
#	And User selects the quantity and sets it to <quantity> and adds it to bag
#	And User navigate to login page
#	And User try to login using <email> and <password>
#	And User goes to cart page
#	And User removes the second item
#	Then User verifies title on product page matches item on cart page
#	And User removes all items in cart
	
#	Examples:
#	| brand  | item | email                      | password | secondItem | quantity |
#	| SPEEDO | suit | myaccountspeedo5@gmail.com | Passw0rd | power      | 1        |

#@id=22 @positive @parallel @cart_module @cart
#Scenario Outline: Add product with more than 1 quantity as guest user to cart then reduce quantity as signed in user
#	Given User access <brand> website
#	When User searches for <item>
#	And User clicks on product
#	And User chooses random size
#	And User selects the quantity and sets it to <quantity> and adds it to bag
#	And User navigate to login page
#	And User try to login using <email> and <password>
#	And User goes to cart page
#	And User adjusts the quantity to <quantityLess>
#	Then User verifies <quantityLess> of items in cart less
#	And User removes all items in cart

#	Examples:
#	| brand  | item | email                      | password | quantity | quantityLess |
#	| SPEEDO | suit | myaccountspeed05@gmail.com | Passw0rd | 2        | 1            |

#@id=23 @negative @parallel @cart_module @cart
#Scenario Outline: Add an item with a quantity lower than the quantity requested
#	Given User access <brand> website
#	When User searches for <item>
#	And User clicks on product
#	And User chooses random size
#	And User adjusts <quantity> and adds to bag
#	Then User verifies page level message for less quantity displayed
	
#	Examples:
#	| brand  | item          | quantity	|	
#	| SPEEDO | female jacket | 10       |
		
@id=24 @positive @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Add the same item to a cart twice and check cart for quantity
	Given User access <brand> website
#	And User add <item> to cart
#	And User add <item> to cart
    And User searches on mobile an <item> with style number and adds it to cart
    And User searches on mobile an <item> with style number and adds it to cart
	Then User verifies <quantity> of items in cart less
	
	Examples:
	| brand  | item    | quantity | 
	| SPEEDO | 7750130 | 2        | 

#@id=25 @negative @parallel @cart_module @cart @brand=SPMobile @mobile
#Scenario Outline: Adding more then 50 items to cart
#	Given User access <brand> website
#	And User adds <quantity> of items <item> to cart
#	Then User verifies error on item page <error>
	
#	Examples:
#	| brand  | quantity | item   	  | error                                                                                                                                                                                                                  |
#	| SPEEDO | 50       | swimsuit    | Error: The maximum number of items in the shopping cart is 50. You currently have 50 items and have attempted to add 1 more. Remove some items and try again, or checkout and add the items to an empty shopping cart. |

#@id=26 @negative @parallel @cart_module
#Scenario Outline: Verify applying valid promo code but not applicable for an item in cart as guest user
#	Given User access <brand> website
#	And User add <item> to cart
#	And User applies promo <code>
#	Then User should verify valid promo code is not applicable for item
#	
#  @brand=CKUS
#  Examples: 
#  | brand | item         | code       |
#  | CKUS  | 21801776-438 | CKUFSBVKHJ |
#  
#  @brand=TH 
#  Examples: 
#  | brand | item    | code       |
#  | TH    | FM01016 | EXTRAEXTRA |
#  
#  @cart
#  Examples:
#  | brand  | item    | code  |
#  | SPEEDO | 7723019 | LTF25 |

#@id=27 @negative @parallel @cart_module
#Scenario Outline: Verify applying valid promo code which is applicable to only one item in cart as guest user
#	Given User access <brand> website
#	And User add <item> to cart
#	And User add <secondItem> to cart
#	And User applies promo <code> 
#	Then User should verify valid promo code <code> is applicable for one item
#	
#  @brand=CKUS
#  Examples: 
#  | brand | item         | code   | secondItem |
#  | CKUS  | 21801776-438 | FALL20 | 72253719   |
#   
#  @brand=TH 
#  Examples: 
#  | brand | item    | code      | secondItem |
#  | TH    | FM01016 | CCP2B61QF | UU00004    |
#  
#  @cart
#  Examples:
#  | brand  | item      | code  | secondItem |
#  | SPEEDO | 7719782-2 | LTF25 | 7723019    |

@id=28 @negative @parallel @cart_module @cart @brand=SPMobile @mobile
Scenario Outline: Verify adding an item to cart as signed in user and apply invalid promo code
	Given User access <brand> website
	When User navigate to mobile login page
	And User try to login using <email> and <password>
	Then User should be login successfully
#	When User searches on mobile with keyword as <item> 
#	And User clicks on product
#	And User chooses random size
#	And User clicks add to bag 
#	And User goes to cart page
    And User searches on mobile an <item> with style number and adds it to cart
	And User applies promo <code> 
	Then User should get promo error message <text>
	And User removes all items in cart
	
	Examples:
	| brand | email                       | password | item    | code   | text                                |
	| SPEEDO| myaccountspeedo43@gmail.com | Passw0rd | 7530331 | TTTEEE | Promotion code "TTTEEE" is invalid. |

#@id=29 @positive @parallel @cart_module
#Scenario Outline: Verify adding an item to cart as signed in user and apply valid promo code
#	Given User access <brand> website
#	When User navigate to login page
#	And User try to login using <email> and <password>
#	And User add <item> to cart
#	And User applies promo <code>
#	Then User should verify valid promo code <code> is applicable for one item
#	And User removes promo code
#	And User removes all items in cart
#	
#	@brand=CKUS
#	Examples:
#	| brand | email                 | password | item         | code   |
#	| CKUS  | willtest1@yopmail.com | Passw0rd | 21801776-438 | FALL20 |
#	
#	@brand=TH
#	Examples:
#	| brand | email                 | password | item    | code      | 
#	| TH    | willtest1@yopmail.com | Passw0rd | WW24162 | CCP2B61QF | 
#	
#	@cart
#	Examples:
#	| brand  | email                 | password | item    | code  |
#	| SPEEDO | willtest1@yopmail.com | Passw0rd | 7719727 | LTF25 | 

