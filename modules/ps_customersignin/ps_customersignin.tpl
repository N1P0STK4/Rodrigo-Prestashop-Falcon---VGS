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
<div class="col flex-grow-0 header-top__block header-top__block--user">
  <a
    class="header-top__link"
    rel="nofollow"
    href="{$urls.pages.authentication}?back={$urls.current_url|urlencode}"
    {if $logged}
      title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
    {else}
      title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
    {/if}
  >
    <div class="header-top__icon-container">
      <svg width="17" height="21" viewBox="0 0 17 21" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.999 4.5C11.999 5.49456 11.6039 6.44839 10.9007 7.15165C10.1974 7.85491 9.24356 8.25 8.249 8.25C7.25444 8.25 6.30061 7.85491 5.59735 7.15165C4.89409 6.44839 4.499 5.49456 4.499 4.5C4.499 3.50544 4.89409 2.55161 5.59735 1.84835C6.30061 1.14509 7.25444 0.75 8.249 0.75C9.24356 0.75 10.1974 1.14509 10.9007 1.84835C11.6039 2.55161 11.999 3.50544 11.999 4.5ZM0.75 18.618C0.782135 16.6504 1.58634 14.7742 2.98918 13.394C4.39202 12.0139 6.28109 11.2405 8.249 11.2405C10.2169 11.2405 12.106 12.0139 13.5088 13.394C14.9117 14.7742 15.7159 16.6504 15.748 18.618C13.3954 19.6968 10.8371 20.2535 8.249 20.25C5.573 20.25 3.033 19.666 0.75 18.618Z" stroke="#328189" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </div>
  </a>
</div>
