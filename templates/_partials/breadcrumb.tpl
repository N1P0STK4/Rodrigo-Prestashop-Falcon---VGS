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

{block name='breadcrumb'}
  {if $breadcrumb.links|count > 1}
    <nav class="breadcrumb-wrapper" aria-label="breadcrumb" data-depth="{$breadcrumb.count}">
      {block name='breadcrumb_list'}
        <ol class="breadcrumb">
          {foreach from=$breadcrumb.links item=path name=breadcrumb}
            {block name='breadcrumb_item'}
            <li class="breadcrumb-item{if $smarty.foreach.breadcrumb.last} active{/if}"{if $smarty.foreach.breadcrumb.last} aria-current="page"{/if}>

              {if !$smarty.foreach.breadcrumb.first}
                <svg width="9" height="13" viewBox="0 0 9 13" fill="none" xmlns="http://www.w3.org/2000/svg" class="breadcrumb-separator">
                  <path d="M1.25003 1.25004L7.18753 6.10817L1.25003 10.9663" stroke="#328189" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              {/if}

              {if !$smarty.foreach.breadcrumb.last}
                <a href="{$path.url}">
              {/if}

              {if $smarty.foreach.breadcrumb.first}
                <svg width="21" height="20" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M0.75 10.0343L9.704 1.07925C10.144 0.64025 10.856 0.64025 11.295 1.07925L20.25 10.0343M3 7.78425V17.9093C3 18.5303 3.504 19.0343 4.125 19.0343H8.25V14.1593C8.25 13.5383 8.754 13.0343 9.375 13.0343H11.625C12.246 13.0343 12.75 13.5383 12.75 14.1593V19.0343H16.875C17.496 19.0343 18 18.5303 18 17.9093V7.78425M6.75 19.0343H15" stroke="#328189" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <span class="sr-only">{$path.title}</span>
              {else}
                {$path.title}
              {/if}

              {if !$smarty.foreach.breadcrumb.last}
                </a>
              {/if}

            </li>
            {/block}
          {/foreach}
        </ol>
      {/block}
    </nav>
  {/if}
{/block}
