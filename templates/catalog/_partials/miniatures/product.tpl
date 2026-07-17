{**
 * Copyright since 2007 PrestaShop SA and Contributors
 *
 * @license AFL-3.0
 *}
{block name='product_miniature_item'}
  {$listingType = $type|default:'listing'}

  <div
    {if $listingType === 'listing'}
      class="products-list__block products-list__block--grid"
    {elseif $listingType === 'slider'}
      class="swiper-slide product-slider__item col-6 col-md-4 col-lg-3"
    {/if}
  >
    <article
      class="product-miniature card js-product-miniature h-100 {block name='product_miniature_item_class'}{/block}"
      data-id-product="{$product.id_product}"
      data-id-product-attribute="{$product.id_product_attribute}"
    >
      {include
        file='catalog/_partials/miniatures/_partials/product-thumb.tpl'
      }

      <div class="product-miniature__information">
        {include
          file='catalog/_partials/miniatures/_partials/product-title.tpl'
        }

        {include
          file='catalog/_partials/miniatures/_partials/product-prices.tpl'
        }

        {block name='product_form'}
          {include
            file='catalog/_partials/miniatures/_partials/product-form.tpl'
          }
        {/block}
      </div>
    </article>
  </div>
{/block}