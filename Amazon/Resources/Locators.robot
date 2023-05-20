*** Variables ***
#Header locators
${HEADER_PRIME}             css=#nav-link-amazonprime
${SEARCH_BAR}               css=#twotabsearchtextbox
${SEARCH_BUTTON}            css=#nav-search-submit-button
${HEADER_CART}              css=#nav-cart

#Footer locators
${PAYMENT_METHOD}           css=.nav_first [href*='footer_pay_tc']

#Product page locators
${ADD_TO_CART}              css=#add-to-cart-button

#Payment methods page locators
${ACCEPTED_CREDIT_CARD}     xpath=//h2[contains(.,'Crédito')]
${ACCEPTED_BOLETO}          xpath=//h2[contains(.,'Boleto')]
${ACCEPTED_PIX}             xpath=//h2[contains(.,'Pix')]
${ACCEPTED_DEBIT_CARD}      xpath=//h2[contains(.,'Débito')]
${ACCEPTED_LIVELO}          xpath=//h2[contains(.,'Livelo')]
