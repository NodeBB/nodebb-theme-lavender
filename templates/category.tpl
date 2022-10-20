<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="category row">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">

		<!-- IMPORT partials/breadcrumbs.tpl -->

		<div class="subcategories mb-2">
			{{{ if hasMoreSubCategories }}}
			<div class="mb-2"><!-- IMPORT partials/category-selector.tpl --></div>
			{{{ end }}}
			<div class="row" component="category/subcategory/container">
				{{{each children}}}
				<!-- IMPORT partials/category_child.tpl -->
				{{{end}}}
			</div>
			{{{ if hasMoreSubCategories}}}
			<button class="btn btn-outline-secondary" component="category/load-more-subcategories">[[category:x-more-categories, {subCategoriesLeft}]]</button>
			{{{ end }}}
		</div>

		<div class="topic-list-header sticky-top btn-toolbar justify-content-between py-2 mb-2 flex-nowrap">
			<div class="d-flex gap-1 align-items-stretch">
				{{{ if privileges.topics:create }}}
				<a href="{config.relative_path}/compose?cid={cid}" component="category/post" id="new_topic" class="btn btn-primary text-nowrap" data-ajaxify="false" role="button">[[category:new_topic_button]]</a>
				{{{ else }}}
					{{{ if !loggedIn }}}
					<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
					{{{ end }}}
				{{{ end }}}

				<a href="{config.relative_path}/{selectedFilter.url}{querystring}" class="d-inline-block">
					<div class="alert alert-warning h-100 m-0 px-2 py-1 d-flex align-items-center hide" id="new-topics-alert"></div>
				</a>
			</div>
			<div class="d-flex gap-1 align-items-stretch">
				<!-- IMPORT partials/category/watch.tpl -->
				<!-- IMPORT partials/category/sort.tpl -->
				<!-- IMPORT partials/category/tools.tpl -->
			</div>
		</div>

		{{{ if !topics.length }}}
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		{{{ end }}}

		<!-- IMPORT partials/topics_list.tpl -->

		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}
	</div>

	{{{ if topics.length }}}
	<div data-widget-area="sidebar" class="col-md-3 col-12 category-sidebar {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{each widgets.sidebar}}}
		{{widgets.sidebar.html}}
		{{{end}}}
	</div>
	{{{ end }}}
</div>

<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

{{{ if !config.usePagination }}}
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
{{{ end }}}
