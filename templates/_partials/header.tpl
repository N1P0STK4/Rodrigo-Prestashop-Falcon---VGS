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
{block name='header_banner'}
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
{/block}



{block name='header_top'}
    <div class="js-header-top-wrapper">
        <div class="header-top js-header-top">

            {block name='header_nav'}
                <nav class="header-nav d-md-block">
                    <div class="container">
                        <div class="header-nav__inner">
                            <div class="header-nav__contact">
                                <span>{l s='Lun-Vie 9:00h - 19:00h' d='Shop.Theme.Global'}</span>

                                <span aria-hidden="true">|</span>

                                <a href="tel:+34976123456">
                                    976 123 456
                                </a>
                            </div>

                            <p class="header-nav__shipping">
                                {l s='Envíos gratuitos por compras' d='Shop.Theme.Global'}
                                <strong>{l s='SUPERIORES a 50€' d='Shop.Theme.Global'}</strong>
                            </p>
                        </div>
                    </div>
                </nav>
            {/block}

            <div class="header-top__content pt-md-3 pb-md-3 pb-md-0 py-2">
                <div class="container">
                    <div class="row header-top__row">

                        <div class="col flex-grow-0 header-top__block header-top__block--menu-toggle d-block d-md-none">
                            <a 
                            class="header-top__link" 
                            rel="nofollow" 
                            href="#" 
                            data-toggle="modal" 
                            data-target="#mobile_top_menu_wrapper">

                                <div class="header-top__icon-container">
                                    <span class="header-top__icon material-icons">
                                        menu
                                    </span>
                                </div>
                                
                            </a>
                        </div>

                        {hook h='displayTop'}

                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_full_width_menu'}
  <div class="header-main-menu d-none d-md-block">
    <div class="container">
      <div class="header-main-menu__inner">

        <div class="header-main-menu__toggle">
            <a
                class="header-main-menu__toggle-link"
                rel="nofollow"
                href="#"
                data-toggle="modal"
                data-target="#mobile_top_menu_wrapper"
                aria-label="{l s='Abrir menú de categorías' d='Shop.Theme.Global'}"
            >
            <span class="material-icons" aria-hidden="true">
              menu
            </span>

            <div class="header-main-menu__categories-label">
                {l s='Categorías' d='Shop.Theme.Global'}
            </div>
          </a>
        </div>

        <div class="header-main-menu__content">
          {hook h='displayNavFullWidth'}
        </div>

      </div>
    </div>
  </div>
{/block}