*** Variables ***
#Header
${search_bar}                    css=#q
${search_suggestion}             css=.product-suggestion
${search_button}                 css=.fa-search
${search_first_product}          css=#search-result-items .grid-tile:nth-child(1)
${search_product_price}          css=.product-suggestion:nth-of-type(2) .product-price
${minicart_icon}                 css=.mini-cart-link
#PLP
${PLP_product_price}             css=.grid-tile:nth-of-type(1) .product-sales-price
#PDP
${PDP_product_details}           css=.pt_product-details
${PDP_color_selector}            css=.color .selectable
${PDP_color_selected}            css=.color .selectable.selected
${PDP_size_selector}             css=.size .selectable:nth-child(1)
${PDP_size_selected}             css=.size .selectable.selected:nth-child(1)
${PDP_quantity}                  css=#Quantity
${PDP_add_cart_disabled}         css=.add-to-cart-disabled
${PDP_add_cart}                  css=#add-to-cart
${PDP_product_price}             css=#product-content .price-sales
#Cart
${cart_page}                     css=#cart-table
${cart_top_checkout}             css=.cart-actions-top [value=Checkout]
${cart_product_price}            css=.cart-row .price-sales
#Checkout Login
${checkout_login_page}           css=.checkoutlogin
${checkout_guest}                css=[value='Checkout as Guest']
#Shipping
${shipping_form}                 css=form[id*='shippingAddress']
${shipping_first_name}           css=[id*='firstName']
${shipping_last_name}            css=[id*='lastName']
${shipping_address1}             css=[id*='address1']
${shipping_city}                 css=[id*='city']
${shipping_postal}               css=[id*='postal']
${shipping_country}              css=[id*='country']
${shipping_state}                css=[id*='state']
${shipping_phone}                css=[id*='phone']
${shipping_same_billing}         css=[id*='useAsBillingAddress']
${shipping_not_gift}             css=[id*='isGift'][value='false']
${shipping_method1}              css=#shipping-method-001
${shipping_continue_billing}     css=[value='Continue to Billing >']
${shipping_summary_price}        css=.order-subtotal td:nth-child(2)
#Billing
${billing_form}                  css=#dwfrm_billing
${billing_email}                 css=[id*='emailAddress']
${billing_method_credit}         css=#is-CREDIT_CARD
${billing_card_owner}            css=[id*='creditCard_owner']
${billing_card_flag}             css=[id*='creditCard_type']
${billing_card_number}           css=[id*='creditCard_number']
${billing_card_month}            css=[id*='creditCard_expiration_month']
${billing_card_year}             css=[id*='creditCard_expiration_year']
${billing_card_cvn}              css=[id*='creditCard_cvn']
${billing_place_order_disabled}  css=[value='Continue to Place Order >'][disabled='disabled']
${billing_place_order}           css=[value='Continue to Place Order >']
${billing_error_message}         css=.error-message
${billing_method_paypal}         css=#is-PayPal
#Place Order
${place_order_page}              css=.step-3.active
${place_order_button}            css=[value='Place Order']
#Order Review
${order_review_confirmation}     css=.confirmation-message
${order_review_product_price}    css=.order-subtotal td:nth-child(2)