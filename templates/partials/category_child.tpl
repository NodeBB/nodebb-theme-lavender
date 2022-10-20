<!-- IF ./isSection -->
<div component="categories/category" class="col-12 category-item mb-3">
	<h1 class="section">{./name}</h1>
</div>
<!-- ELSE -->
<div component="categories/category" class="{{{ if ./class }}}{./class}{{{ else }}}col-md-3 col-sm-6 col-12{{{ end }}} category-item mb-3" data-cid="{./cid}" data-numRecentReplies="{./numRecentReplies}">
	<meta itemprop="name" content="{./name}">

	<div class="category-icon">
		<a style="color: {./color};" href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">
			<div
				id="category-{./cid}"
				class="position-relative category-header category-header-image-{./imageClass}"
				style="
					{{{ if ./backgroundImage }}}background-image: url({./backgroundImage});{{{ end }}}
					{{{ if ./bgColor }}}background-color: {./bgColor};{{{ end }}}
					color: {./color};">
				{{{ if !./link }}}
				<span style="color: {./color};" class="badge {./unread-class}"><i class="fa fa-book" data-bs-toggle="tooltip" title="[[global:topics]]"></i> <span class="human-readable-number" title="{./totalTopicCount}">{./totalTopicCount}</span>&nbsp; <i class="fa fa-pencil" data-bs-toggle="tooltip" title="[[global:posts]]"></i> <span class="human-readable-number" title="{./totalPostCount}">{./totalPostCount}</span></span>
				{{{ end }}}

				{{{ if ./icon }}}
				<div><i class="fa {./icon} fa-4x"></i></div>
				{{{ end }}}
			</div>
		</a>

		<div class="category-box">
			<div class="category-info">
				<a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">
					<h4 class="text-truncate">{{{ if ./icon }}}<i class="fa {./icon} visible-xs-inline"></i> {{{ end }}}{./name}</h4>
				</a>
				<div class="description ms-0 mb-1" itemprop="description">{./descriptionParsed}</div>
				<!-- subcategories -->
				<div class="">
					{{{ each ./children }}}
					<div class="mb-1">
					{buildCategoryIcon(@value, "24px", "rounded-circle")} <a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" class="text-muted">{./name}</a>
					</div>
					{{{ end }}}
				</div>
			</div>

			{{{ if !./link }}}
			{{{ each ./posts }}}
			<div component="category/posts" class="post-preview clearfix">
				<strong><a href="{config.relative_path}/topic/{./topic.slug}">{./topic.title}</a></strong>
				<hr/>
				<a class="float-start me-2" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
					{buildAvatar(./user, "24px", true)}
				</a>
				<div class="post-preview-content">
					<div class="content">
					{./content}
					</div>
					<p class="fade-out"></p>
				</div>

				<span class="pull-right post-preview-footer">
					<span class="timeago" title="{./timestampISO}"></span> &bull;
					<a href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}">[[global:read_more]]</a>
				</span>
			</div>
			{{{ end }}}
			{{{ end }}}
		</div>
	</div>
</div>
<!-- ENDIF ../isSection -->