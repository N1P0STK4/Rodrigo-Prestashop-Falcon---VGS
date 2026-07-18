{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

<div class="footer__left">
  <div class="col-md-5 col-12 mb-lg-4">
    <div class="footer-contact" id="footer_contact_list">

      {if $contact_infos.phone}
        <div class="footer-contact__item">
          <span class="footer-contact__icon" aria-hidden="true">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M2.25 6.75C2.25 15.034 8.966 21.75 17.25 21.75H19.5C20.0967 21.75 20.669 21.5129 21.091 21.091C21.5129 20.669 21.75 20.0967 21.75 19.5V18.128C21.75 17.612 21.399 17.162 20.898 17.037L16.475 15.931C16.035 15.821 15.573 15.986 15.302 16.348L14.332 17.641C14.05 18.017 13.563 18.183 13.122 18.021C11.4849 17.4191 9.99815 16.4686 8.76478 15.2352C7.53141 14.0018 6.58087 12.5151 5.979 10.878C5.817 10.437 5.983 9.95 6.359 9.668L7.652 8.698C8.015 8.427 8.179 7.964 8.069 7.525L6.963 3.102C6.90214 2.85869 6.76172 2.6427 6.56405 2.48834C6.36638 2.33397 6.1228 2.25008 5.872 2.25H4.5C3.90326 2.25 3.33097 2.48705 2.90901 2.90901C2.48705 3.33097 2.25 3.90326 2.25 4.5V6.75Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </span>

          <a class="footer-contact__link" href="tel:{$contact_infos.phone|replace:' ':''}">
            {$contact_infos.phone}
          </a>
        </div>
      {/if}

      {if $contact_infos.email && $display_email}
        <div class="footer-contact__item">
          <span class="footer-contact__icon" aria-hidden="true">
            <svg width="24" height="21" viewBox="0 0 24 21" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M21.75 7.77296V8.55545C21.75 8.9063 21.64 9.25062 21.4318 9.55185C21.2235 9.85308 20.9247 10.1 20.567 10.2664L14.089 13.2789M2.25 7.77296V8.55545C2.24998 8.9063 2.35995 9.25062 2.56824 9.55185C2.77652 9.85308 3.07534 10.1 3.433 10.2664L9.911 13.2789M9.911 13.2789L10.933 12.8038C11.2609 12.6513 11.6275 12.5714 12 12.5714C12.3725 12.5714 12.7391 12.6513 13.067 12.8038L14.09 13.2789L18.75 15.4467M9.911 13.2789L5.25 15.4467M21.75 16.8415C21.75 17.3569 21.5129 17.8511 21.091 18.2156C20.669 18.58 20.0967 18.7847 19.5 18.7847H4.5C3.90326 18.7847 3.33097 18.58 2.90901 18.2156C2.48705 17.8511 2.25 17.3569 2.25 16.8415V7.63823C2.24998 7.28737 2.35995 6.94306 2.56824 6.64183C2.77652 6.3406 3.07534 6.09369 3.433 5.9273L10.933 2.43895C11.2609 2.2864 11.6275 2.20654 12 2.20654C12.3725 2.20654 12.7391 2.2864 13.067 2.43895L20.567 5.9273C20.9245 6.09362 21.2232 6.34039 21.4315 6.64146C21.6398 6.94252 21.7498 7.28666 21.75 7.63737V16.8415Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </span>

          <span class="footer-contact__email">
            {mailto address=$contact_infos.email encode="javascript"}
          </span>
        </div>
      {/if}

      <div class="footer-contact__item footer-contact__item--address">
        <span class="footer-contact__icon" aria-hidden="true">
          <svg width="24" height="21" viewBox="0 0 24 21" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M15 9.06854C15 9.75572 14.6839 10.4148 14.1213 10.9007C13.5587 11.3866 12.7956 11.6596 12 11.6596C11.2044 11.6596 10.4413 11.3866 9.87868 10.9007C9.31607 10.4148 9 9.75572 9 9.06854C9 8.38137 9.31607 7.72233 9.87868 7.23643C10.4413 6.75052 11.2044 6.47754 12 6.47754C12.7956 6.47754 13.5587 6.75052 14.1213 7.23643C14.6839 7.72233 15 8.38137 15 9.06854Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M19.5 9.06858C19.5 15.2369 12 18.7848 12 18.7848C12 18.7848 4.5 15.2369 4.5 9.06858C4.5 7.35063 5.29018 5.70305 6.6967 4.48828C8.10322 3.27351 10.0109 2.59106 12 2.59106C13.9891 2.59106 15.8968 3.27351 17.3033 4.48828C18.7098 5.70305 19.5 7.35063 19.5 9.06858Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </span>

        <address class="footer-contact__address">
          {$contact_infos.address.address1}<br>
          {$contact_infos.address.postcode}, {$contact_infos.address.city}
        </address>
      </div>

    </div>
  </div>
</div>