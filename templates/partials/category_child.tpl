<!-- IF ./isSection -->
<div component="categories/category" class="col-12 category-item mb-3">
	<h1 class="section">{./name}</h1>
</div>
<!-- ELSE -->
<div component="categories/category" class="{{{ if ./class }}}{./class}{{{ else }}}col-md-3 col-sm-6 col-12{{{ end }}} category-item mb-3" data-cid="{./cid}" data-numRecentReplies="{./numRecentReplies}">
	<meta itemprop="name" content="{./name}">

	<div class="category-icon shadow-xs">
		<a style="color: {./color};" href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">
			<div
				id="category-{./cid}"
				class="position-relative text-center p-4 category-header category-header-image-{./imageClass}"
				style="
					{{{ if ./backgroundImage }}}background-image: url({./backgroundImage});{{{ end }}}
					{{{ if ./bgColor }}}background-color: {./bgColor};{{{ end }}}
					color: {./color};">
				{{{ if !./link }}}
				<span style="color: {./color}; top: 90px; right: 10px;" class="position-absolute opacity-75 badge {./unread-class}"><i class="fa fa-book" data-bs-toggle="tooltip" title="[[global:topics]]"></i> <span title="{./totalTopicCount}">{humanReadableNumber(./totalTopicCount)}</span>&nbsp; <i class="fa fa-pencil" data-bs-toggle="tooltip" title="[[global:posts]]"></i> <span title="{./totalPostCount}">{humanReadableNumber(./totalPostCount)}</span></span>
				{{{ end }}}

				{{{ if ./icon }}}
				<div><i class="fa {./icon} fa-4x"></i></div>
				{{{ end }}}
			</div>
		</a>

		<div class="category-box position-relative card border-0 p-0">
			<div class="category-info p-2">
				<a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">
					<h4 class="text-truncate fw-bold mt-0 mb-2">{{{ if ./icon }}}<i class="fa {./icon} visible-xs-inline"></i> {{{ end }}}{./name}</h4>
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
			<div component="category/posts" class="post-preview p-2 text-break">
				<strong><a href="{config.relative_path}/topic/{./topic.slug}">{./topic.title}</a></strong>
				<hr class="mb-2 mt-1" />
				<div class="d-flex gap-1">
					<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
						{buildAvatar(./user, "24px", true)}
					</a>
					<div class="post-preview-content overflow-hidden">
						<div class="content">
						{./content}
						</div>
						<p class="fade-out"></p>
					</div>
				</div>
				<span class="pull-right post-preview-footer overflow-hidden position-relative opacity-75 mt-2 small">
					<span class="timeago" title="{./timestampISO}"></span> &bull;
					<a href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}">[[global:read-more]]</a>
				</span>
			</div>
			{{{ end }}}
			{{{ end }}}
		</div>
	</div>
</div>
<!-- ENDIF ../isSection -->