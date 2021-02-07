<div class="row categories" itemscope itemtype="http://www.schema.org/ItemList">
	<div class="<!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
		{{{ if pagination.pages.length }}}
		<div><!-- IMPORT partials/category-selector.tpl --></div>
		{{{ end }}}
		<div class="row <!-- IF !disableMasonry -->masonry<!-- ENDIF !disableMasonry -->">
			<!-- BEGIN categories -->
			<!-- IMPORT partials/category_child.tpl -->
			<!-- END categories -->
		</div>
		<!-- IMPORT partials/paginator.tpl -->
	</div>

	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		<!-- BEGIN widgets.sidebar -->
		{{widgets.sidebar.html}}
		<!-- END widgets.sidebar -->
	</div>
</div>
