{block name='pagination_page_list'}
  {if $pagination.should_be_displayed}
    <nav
      class="catalog-pagination"
      aria-label="{l s='Pagination' d='Shop.Theme.Catalog'}"
    >

      <p class="pagination-summary">
        {l
          s='Mostrando %from% - %to% de %total% artículos'
          d='Shop.Theme.Catalog'
          sprintf=[
            '%from%' => $listing.pagination.items_shown_from,
            '%to%' => $listing.pagination.items_shown_to,
            '%total%' => $listing.pagination.total_items
          ]
        }
      </p>

      <ul class="catalog-pagination__list">
        {foreach from=$pagination.pages item="page"}
          <li
            class=" catalog-pagination__item catalog-pagination__item--{$page.type} {if $page.current}is-active{/if} {if !$page.clickable}is-disabled{/if}">
            {if $page.type === 'spacer'}
              <span class="catalog-pagination__link catalog-pagination__link--spacer" aria-hidden="true">
                &hellip;
              </span>
            {else}
              <a
                href="{$page.url}"
                rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                class="catalog-pagination__link js-search-link"
                {if !$page.clickable}aria-disabled="true" tabindex="-1"{/if}
                {if $page.current}aria-current="page"{/if}
              >
                {if $page.type === 'previous'}
                  <span
                    class="material-icons catalog-pagination__icon"
                    aria-hidden="true"
                  >
                    arrow_back
                  </span>

                  <span>{l s='Previous' d='Shop.Theme.Actions'}</span>

                {elseif $page.type === 'next'}
                  <span>{l s='Next' d='Shop.Theme.Actions'}</span>

                  <span
                    class="material-icons catalog-pagination__icon"
                    aria-hidden="true"
                  >
                    arrow_forward
                  </span>

                {else}
                  <span>{$page.page}</span>
                {/if}
              </a>
            {/if}
          </li>
        {/foreach}
      </ul>
    </nav>
  {/if}
{/block}