{block name='product_tabs'}
  {if $product.description}

    <section class="product-information">
      <h2 class="product-information__title">
        {l s='Información del producto' d='Shop.Theme.Catalog'}
      </h2>

      {block name='product_description'}
        {cms_images_block webpEnabled=$webpEnabled}
          <div class="product-information__content cms-content">
            {$product.description nofilter}
          </div>
        {/cms_images_block}
      {/block}
    </section>

  {/if}
{/block}