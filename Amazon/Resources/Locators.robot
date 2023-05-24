*** Variables ***
#Header locators
${HEADER_PRIME}                     css=#nav-link-amazonprime
${SEARCH_BAR}                       css=#twotabsearchtextbox
${SEARCH_BUTTON}                    css=#nav-search-submit-button
${HEADER_CART}                      css=#nav-cart
${HEADER_ACC_LIST}                  css=#nav-link-accountList
${HEADER_LOGIN}                     css=#nav-flyout-ya-signin
${HEADER_YOUR_ACC}                  css=#nav-al-your-account
${HEADER_WISHLIST}                  css=#nav-al-wishlist a
${HEADER_YOUR_ORDERS}               css=#nav_prefetch_yourorders
${HEADER_YOUR_ORDERS}               css=#nav_prefetch_yourorders

#Footer locators
${FOOTER_PAYMENT_METHODS}           css=.nav_first [href*='footer_pay_tc']
${FOOTER_BUY_WITH_POINTS}           css=.nav_last [href*='footer_pay_tc']
${FOOTER_CORPORATE_INFO}            css=.navFooterLinkCol [href*='corporate']
${FOOTER_JOBS}                      css=.navFooterLinkCol [href*='jobs']
${FOOTER_PRESS_RELEASE}             xpath=//a[contains(.,'Comunicados à imprensa')]
${FOOTER_COMMUNITY}                 xpath=//a[contains(.,'Comunidade')]
${FOOTER_ACCESSIBILITY}             css=.navFooterLinkCol [href*='accessibility']
${FOOTER_SCIENCE}                   css=.navFooterLinkCol [href*='science']
${FOOTER_LOGO}                      css=.navFooterLogoLine a
${FOOTER_SELL_ON_AMAZON}            css=.navFooterLinkCol [href*='footerDesk']
${FOOTER_PROTECT_BUILD_BRAND}       css=.navFooterLinkCol [href*='brand']
${FOOTER_PUBLISH_BOOKS}             css=.navFooterLinkCol [href*='kdp']
${FOOTER_BE_ASSOCIATE}              css=.navFooterLinkCol [href*='associados']
${FOOTER_ADVERTISING}               css=.navFooterLinkCol [href*='advertising']
${FOOTER_AMAZON_COVID}              css=.navFooterLinkCol [href*='covid']
${FOOTER_YOUR_ACCOUNT}              css=.navFooterLinkCol [href*='footer_ya']
${FOOTER_SHIP_RATES}                css=.navFooterLinkCol [href*='shiprates']
${FOOTER_RETURNS}                   css=.navFooterLinkCol [href*='returns']
${FOOTER_CONTENT_DEVICES}           css=.navFooterLinkCol [href*='mycd']
${FOOTER_HELP}                      css=.navFooterLinkCol [href*='_he']

#Product page locators
${ADD_TO_CART}                      css=#add-to-cart-button

#Payment methods page locators
${ACCEPTED_CREDIT_CARD}             xpath=//h2[contains(.,'Crédito')]
${ACCEPTED_BOLETO}                  xpath=//h2[contains(.,'Boleto')]
${ACCEPTED_PIX}                     xpath=//h2[contains(.,'Pix')]
${ACCEPTED_DEBIT_CARD}              xpath=//h2[contains(.,'Débito')]
${ACCEPTED_LIVELO}                  xpath=//h2[contains(.,'Livelo')]

#Help page locators
${FIND_MORE_SOLUTIONS}              css=.a-search input
${MORE_SOLUTIONS_RESULTS}           css=#search-help p b
