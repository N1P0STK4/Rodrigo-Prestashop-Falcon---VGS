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
                    {l s='Marca:' d='Shop.Theme.Catalog'}
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
                    {l s='Referencia:' d='Shop.Theme.Catalog'}
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
                    {l s='Disponibilidad:' d='Shop.Theme.Catalog'}
                  </span>

                  <span class="product-meta__value">                     
                    {if $product.quantity > 0}
                      {l s='Inmediata' d='Shop.Theme.Catalog'}
                    {else}
                      {l s='Fuera de stock' d='Shop.Theme.Catalog'}
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
                            {l s='This pack contains' d='Shop.Theme.Catalog'}
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