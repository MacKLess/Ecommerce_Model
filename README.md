# E-Commerce Model Working Title

### _Epicodus Project in Ruby on Rails, December 8, 2017_

### By L. Devin MacKrell

## Description

_This is a mock website for an unspecified e-commerce store. It has basic user authentication, so that only logged in users may review products, and only administrators can create, edit, and delete products._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
<!-- * Create a ```.env``` file and format as follows:
  ```
  PUBLISHABLE_KEY='[Your Stripe Publishable Key]'
  SECRET_KEY='[Your Stripe Secret Key]'

  CURRENCYLAYERKEY='[Your Currency Layer Key]'
  AVATAX_KEY='[Your Avatax API Key]'
  ```  
  * You will need to acquire API keys for [Stripe](https://stripe.com/docs), [AvaTax](https://developer.avalara.com/avatax/dev-guide/) and [Currency Layer](https://currencylayer.com/). -->
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  rails s
  ```
* Open ```localhost:3000``` in your web browser
* **To give an account admin privileges:**
  * In the project root run ```rails c```
  * Then run:
    ```ruby
    User.find_by(email: "[account email address]").update(admin: true)
    ```
  * The account will now have admin access to the app.

## Specifications

* Products  
  * All users may view products.
    * Users can show/hide detail page for each product from index using AJAX.
    * Product detail displays: name, price, the description, and image.
  * Users can add products to shopping cart from index page using AJAX.
    * Added items will display updated item count and cost in navbar using AJAX.
  * Users can delete items from shopping cart using AJAX.
    * The total price will be updated upon removal of each item.


<!-- ## Known Bugs:

* _When updating a product to "Featured," if there are no other featured products AJAX will not display the "Featured" section without a page refresh._
* _Products updated to "On Sale" will not display in the "On Sale" section of the homepage without a page refresh._
* _If cart is empty, refresh is required to display change of item from Raincheck to Cart._ -->

## Support and contact details

_Please contact: [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap
* Devise
* Stripe
* AJAX

### License

Copyright (c) 2017 **L. Devin MacKrell**

*This software is licensed under the MIT license.*





# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

To set up:

* `rake db:setup`

* Sorry, didn't get around to tests. It mostly works. There might be a few bugs.
