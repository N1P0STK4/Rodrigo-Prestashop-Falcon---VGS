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

{extends file=$layout}

{block name='head' append}
  {if $product.show_price}
    <meta
      property="product:pretax_price:amount"
      content="{$product.price_tax_exc}"
    >
    <meta
      property="product:pretax_price:currency"
      content="{$currency.iso_code}"
    >
    <meta
      property="product:price:amount"
      content="{$product.price_amount}"
    >
    <meta
      property="product:price:currency"
      content="{$currency.iso_code}"
    >
  {/if}

  {if isset($product.weight) && $product.weight != 0}
    <meta
      property="product:weight:value"
      content="{$product.weight}"
    >
    <meta
      property="product:weight:units"
      content="{$product.weight_unit}"
    >
  {/if}
{/block}

{block name='head' prepend}
  {if $product.default_image}
    <link
      rel="preload"
      href="{$product.default_image.bySize.large_default.url}"
      as="image"
    >
  {/if}
{/block}

{block name='content'}

  <section id="main" class="product-page">
    <div class="product-page__container">
      <div class="product-main row product-container js-product-container">
        <div class="product-main__gallery col-md-5 mb-4">
          {block name='page_content_container'}
            <div class="product-main__gallery-container">
              {block name='page_content'}
                <div class="product-main__gallery-content position-relative">

                  <div class="product-main__flags">
                    {include file='catalog/_partials/product-flags.tpl'}
                  </div>

                  {block name='product_cover_thumbnails'}
                    <div class="product-main__media">
                      {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                    </div>
                  {/block}
                </div>
              {/block}
            </div>
          {/block}
        </div>

        <div class="product-main__summary product-details col-md-7 mb-4">
          <div class="product-summary">
            {block name='page_header_container'}
              <header class="product-summary__header">

                {block name='page_header'}
                  <h1 class="product-summary__title h1">
                    {block name='page_title'}
                      {$product.name}
                    {/block}
                  </h1>
                {/block}

              </header>
            {/block}
            <div class="product-summary__information product-information">

              {block name='product_description_short'}
                <div
                  id="product-description-short-{$product.id}"
                  class="product-summary__description product-description cms-content"
                >
                  {$product.description_short nofilter}
                </div>
              {/block}

              {if $product.is_customizable && count($product.customizations.fields)}
                {block name='product_customization'}
                  <div class="product-summary__customization">
                    {include
                      file="catalog/_partials/product-customization.tpl"
                      customizations=$product.customizations
                    }
                  </div>
                {/block}
              {/if}

              <div class="product-summary__meta product-meta">

                <div class="product-meta__item">
                  <span class="product-meta__label">
                    {l s='Marca:' d='Shop.Theme.Product'}
                  </span>

                  <span class="product-meta__value">
                    {if isset($product_manufacturer->name) && $product_manufacturer->name}
                      {$product_manufacturer->name}
                    {elseif isset($product.manufacturer_name) && $product.manufacturer_name}
                      {$product.manufacturer_name}
                    {else}
                      —
                    {/if}
                  </span>
                </div>

                <div class="product-meta__item">
                  <span class="product-meta__label">
                    {l s='Referencia:' d='Shop.Theme.Product'}
                  </span>

                  <span class="product-meta__value">
                    {if isset($product.reference_to_display) && $product.reference_to_display}
                      {$product.reference_to_display}
                    {else}
                      —
                    {/if}
                  </span>
                </div>

                <div class="product-meta__item">
                  <span class="product-meta__label">
                    {l s='Disponibilidad:' d='Shop.Theme.Product'}
                  </span>

                  <span class="product-meta__value">                     
                    {if $product.quantity > 0}
                      {l s='Inmediata' d='Shop.Theme.Product'}
                    {else}
                      {l s='Fuera de stock' d='Shop.Theme.Product'}
                    {/if}
                  </span>
                </div>

              </div>

              {block name='product_prices'}
                <div class="product-summary__prices">
                  {include file='catalog/_partials/product-prices.tpl'}
                </div>
              {/block}

              <div class="product-summary__actions product-actions js-product-actions">

                {block name='product_buy'}
                  <form
                    class="product-summary__form"
                    action="{$urls.pages.cart}"
                    method="post"
                    id="add-to-cart-or-refresh"
                  >

                    <input
                      type="hidden"
                      name="token"
                      value="{$static_token}"
                    >

                    <input
                      type="hidden"
                      name="id_product"
                      value="{$product.id}"
                      id="product_page_product_id"
                    >

                    <input
                      type="hidden"
                      name="id_customization"
                      value="{$product.id_customization}"
                      id="product_customization_id"
                      class="js-product-customization-id"
                    >

                    {block name='product_variants'}
                      <div class="product-summary__variants">
                        {include file='catalog/_partials/product-variants.tpl'}
                      </div>
                    {/block}

                    {block name='product_pack'}
                      {if $packItems}
                        <section class="product-summary__pack product-pack">

                          <h2 class="product-pack__title h4">
                            {l s='This pack contains' d='Shop.Theme.Product'}
                          </h2>

                          <div class="product-pack__items card-group-vertical mb-4">

                            {foreach from=$packItems item="product_pack"}
                              {block name='product_miniature'}
                                <div class="product-pack__item">
                                  {include
                                    file='catalog/_partials/miniatures/pack-product.tpl'
                                    product=$product_pack
                                    showPackProductsPrice=$product.show_price
                                  }
                                </div>
                              {/block}
                            {/foreach}

                          </div>

                        </section>
                      {/if}
                    {/block}

                    {block name='product_discounts'}
                      <div class="product-summary__discounts">
                        {include file='catalog/_partials/product-discounts.tpl'}
                      </div>
                    {/block}

                    {block name='product_add_to_cart'}
                      <div class="product-summary__add-to-cart">
                        {include file='catalog/_partials/product-add-to-cart.tpl'}
                      </div>
                    {/block}

                    {block name='product_additional_info'}
                      <div class="product-summary__additional-info">
                        {include file='catalog/_partials/product-additional-info.tpl'}
                      </div>
                    {/block}

                    {*
                      Input to refresh product HTML removed.
                      Block kept for compatibility with themes.
                    *}
                    {block name='product_refresh'}{/block}

                  </form>
                {/block}

              </div>

              <div class="product-shipping-notice">
                <span class="product-shipping-notice__icon" aria-hidden="true">
                  <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.75 5.01562C8.8875 5.01562 9 4.90312 9 4.76562V4.26562C9 4.12813 8.8875 4.01562 8.75 4.01562H1.25C1.1125 4.01562 1 4.12813 1 4.26562V4.76562C1 4.90312 1.1125 5.01562 1.25 5.01562H8.75ZM19.75 11.0156H19V7.6375C19 7.1125 18.7875 6.59687 18.4125 6.225L15.7906 3.60313C15.4219 3.22813 14.9062 3.01562 14.3781 3.01562H13V1.47187C13 0.66875 12.3063 0.015625 11.4563 0.015625H3.54375C2.69375 0.015625 2 0.66875 2 1.47187V2.01562H0.25C0.1125 2.01562 0 2.12812 0 2.26562V2.76562C0 2.90313 0.1125 3.01562 0.25 3.01562H7.75C7.8875 3.01562 8 2.90313 8 2.76562V2.26562C8 2.12812 7.8875 2.01562 7.75 2.01562H3V1.47187C3 1.21875 3.24375 1.01562 3.54375 1.01562H11.4563C11.7563 1.01562 12 1.21875 12 1.47187V11.0156H6.4875C6.03125 10.4125 5.3125 10.0156 4.5 10.0156C3.93438 10.0156 3.41875 10.2094 3 10.5281V8.01562H2V12.5156C2 13.8969 3.11875 15.0156 4.5 15.0156C5.88125 15.0156 7 13.8969 7 12.5156C7 12.3438 6.98125 12.1781 6.95 12.0156H13.05C13.0156 12.1781 13 12.3438 13 12.5156C13 13.8969 14.1187 15.0156 15.5 15.0156C16.8813 15.0156 18 13.8969 18 12.5156C18 12.3438 17.9813 12.1781 17.95 12.0156H19.75C19.8875 12.0156 20 11.9031 20 11.7656V11.2656C20 11.1281 19.8875 11.0156 19.75 11.0156ZM4.5 14.0156C3.67188 14.0156 3 13.3438 3 12.5156C3 11.6875 3.67188 11.0156 4.5 11.0156C5.32812 11.0156 6 11.6875 6 12.5156C6 13.3438 5.32812 14.0156 4.5 14.0156ZM13 4.01562H14.3781C14.6406 4.01562 14.9 4.12187 15.0844 4.30937L17.7062 6.93125C17.7312 6.95625 17.7406 6.99063 17.7625 7.01875H13V4.01562ZM15.5 14.0156C14.6719 14.0156 14 13.3438 14 12.5156C14 11.6875 14.6719 11.0156 15.5 11.0156C16.3281 11.0156 17 11.6875 17 12.5156C17 13.3438 16.3281 14.0156 15.5 14.0156ZM18 11.0156H17.4875C17.0312 10.4125 16.3125 10.0156 15.5 10.0156C14.6875 10.0156 13.9688 10.4125 13.5125 11.0156H13V8.01562H18V11.0156ZM8 6.76562V6.26562C8 6.12813 7.8875 6.01562 7.75 6.01562H0.25C0.1125 6.01562 0 6.12813 0 6.26562V6.76562C0 6.90312 0.1125 7.01562 0.25 7.01562H7.75C7.8875 7.01562 8 6.90312 8 6.76562Z" fill="#592BC7" stroke="#592BC7" stroke-width="0.03125"/>
                  </svg>
                </span>

                <span class="product-shipping-notice__text">
                  {l s='Cómpralo ahora y recíbelo mañana' d='Shop.Theme.Product'}
                </span>
              </div>

              {block name='product_features'}
                {if isset($product.grouped_features) && $product.grouped_features|count}

                  <div class="product-summary__features product-features-grid">

                    {foreach from=$product.grouped_features item=feature}
                      <div class="product-features-grid__item">

                        <span class="product-features-grid__label">
                          {$feature.name}
                        </span>

                        <span class="product-features-grid__value">
                          {$feature.value|escape:'htmlall'|nl2br nofilter}
                        </span>

                      </div>
                    {/foreach}

                  </div>

                {/if}
              {/block}

              {block name='hook_display_reassurance'}
                {capture name='reassurance_content'}
                  {hook h='displayReassurance'}
                {/capture}

                {if $smarty.capture.reassurance_content|trim}
                  <div class="product-summary__reassurance">
                    {$smarty.capture.reassurance_content nofilter}
                  </div>
                {/if}
              {/block}

            </div>

          </div>

        </div>

      </div>

      <div class="product-page__tabs">
        {include file="catalog/_partials/product-tabs.tpl"}
      </div>

      {block name='product_footer'}
        <div class="product-page__footer-product">
          {hook h='displayFooterProduct' product=$product category=$category}
        </div>
      {/block}

      {block name='product_accessories'}
        {if $accessories}
          <div class="product-page__accessories">
            {include
              file='catalog/_partials/product-accessories.tpl'
              products=$accessories
            }
          </div>
        {/if}
      {/block}

      {block name='product_images_modal'}
        <div class="product-page__images-modal">
          {include file='catalog/_partials/product-images-modal.tpl'}
        </div>
      {/block}

      {block name='page_footer_container'}
        <footer class="product-page__footer page-footer">

          {block name='page_footer'}
            <!-- Footer content -->
          {/block}

        </footer>
      {/block}

    </div>

  </section>

{/block}