<ul component="category" class="topic-list list-unstyled" id="topics-container">
	<meta itemprop="itemListOrder" content="descending">
	{{{ each topics }}}
	<li component="category/topic" class="category-item card card-body px-2 py-0 border-top-0 border-bottom-0 border-end-0 {function.generateTopicClass}"  itemprop="itemListElement" <!-- IMPORT partials/data/category.tpl -->>
		<a id="{./index}" data-index="{./index}" component="topic/anchor"></a>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="p-2 mb-0">
			<div class="row">
				<div class="col-md-7 col-sm-8">
					{{{ if showSelect }}}
					<i class="fa fa-fw fa-square-o float-start pointer" component="topic/select"></i>
					{{{ end }}}

					<div class="float-start profile-pic mx-3">
						<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
							<!-- IF topics.thumb -->
							<img src="{topics.thumb}" class="user-img" title="{topics.user.username}" />
							<!-- ELSE -->
							{buildAvatar(./user, "48px", true)}
							<!-- ENDIF topics.thumb -->
						</a>
					</div>
					<div class="overflow-hidden">
						<div>
							<i component="topic/scheduled" class="fa fa-clock-o {{{ if !topics.scheduled }}}hidden{{{ end }}}" title="[[topic:scheduled]]"></i>
							<i component="topic/pinned" class="fa fa-thumb-tack {{{ if (topics.scheduled || !topics.pinned) }}}hidden{{{ end }}}" title="{{{ if !../pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {../pinExpiryISO}]]{{{ end }}}"></i>
							<i component="topic/locked" class="fa fa-lock {{{ if !topics.locked }}}hidden{{{ end }}}" title="[[topic:locked]]"></i>
							<i component="topic/moved" class="fa fa-arrow-circle-right {{{ if !topics.oldCid }}}hidden{{{ end }}}" title="[[topic:moved]]"></i>
							{{{each topics.icons}}}{@value}{{{end}}}

							{{{ if topics.noAnchor }}}
							<span class="fs-4 topic-title" component="topic/header">{topics.title}</span><br />
							{{{ else }}}
							<a class="fs-4 topic-title" component="topic/header" href="{config.relative_path}/topic/{topics.slug}" itemprop="url">{topics.title}</a><br />
							{{{ end }}}

							<div class="d-inline-block mb-1">
								{buildCategoryIcon(./category, "24px", "rounded-circle")}
								<a class="text-muted small" href="{config.relative_path}/category/{topics.category.slug}">{topics.category.name}</a>
							</div>
							&bull; <span class="timeago small" title="{topics.timestampISO}"></span>
							<!-- IF !topics.unreplied -->
							<span class="hidden-md hidden-lg" component="topic/teaser">
							<br/>
							<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><span class="timeago small" title="{topics.teaser.timestampISO}"></span></a>
							</span>
							<!-- ENDIF !topics.unreplied -->
							<br/>
							{{{ if topics.tags.length }}}
							<span class="tag-list hidden-xs mb-1">
								{{{ each ./tags }}}
								<!-- IMPORT partials/topic/tag.tpl -->
								{{{ end }}}
							</span>
							{{{ end }}}
						</div>
					</div>
				</div>

				<div class="col-1 text-center category-stat hidden-xs stats-votes">
					<strong class="fs-3" title="{topics.votes}">{humanReadableNumber(topics.votes)}</strong><br />
					<small class="text-muted">[[global:votes]]</small>
				</div>

				<div class="col-1 text-center category-stat hidden-xs stats-postcount">
					<strong class="fs-3" title="{topics.postcount}">{humanReadableNumber(topics.postcount)}</strong><br />
					<small class="text-muted">[[global:posts]]</small>
				</div>

				<div class="col-1 text-center category-stat hidden-xs stats-viewcount">
					<strong class="fs-3" title="{topics.viewcount}">{humanReadableNumber(topics.viewcount)}</strong><br />
					<small class="text-muted">[[global:views]]</small>
				</div>

				<div class="col-2 category-stat replies hidden-sm hidden-xs d-flex align-items-center" component="topic/teaser">
					{{{ if topics.unreplied }}}
					<p class="no-replies"><a href="{config.relative_path}/topic/{topics.slug}" itemprop="url">[[category:no-replies]]</a></p>
					{{{ else }}}
					<a class="me-2" href="{{{ if ./teaser.user.userslug }}}{config.relative_path}/user/{./teaser.user.userslug}{{{ else }}}#{{{ end }}}">
						{buildAvatar(./teaser.user, "24px", true)}
					</a>
					<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
					{{{ end }}}
				</div>
			</div>
		</div>
	</li>
	{{{ end }}}
</ul>
