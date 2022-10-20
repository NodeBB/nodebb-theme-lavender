<ul component="category" class="topic-list list-unstyled" id="topics-container" data-nextstart="{nextStart}">
	<meta itemprop="itemListOrder" content="descending">
	{{{ each topics }}}
	<li component="category/topic" class="category-item card card-body p-0 border-top-0 border-bottom-0 border-end-0 {function.generateTopicClass}"  itemprop="itemListElement" <!-- IMPORT partials/data/category.tpl -->>
		<a id="{../index}" data-index="{../index}" component="topic/anchor"></a>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="category-body">
			<div class="row">
				<div class="col-md-7 col-sm-8">
					<!-- IF showSelect -->
					<i class="fa fa-fw fa-square-o pull-left pointer" component="topic/select"></i>
					<!-- ENDIF showSelect -->

					<div class="category-profile-pic">
						<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">
							<!-- IF topics.thumb -->
							<img src="{topics.thumb}" class="user-img" title="{topics.user.username}" />
							<!-- ELSE -->
							{buildAvatar(./user, "48px", true)}
							<!-- ENDIF topics.thumb -->
						</a>
					</div>
					<div class="category-text">
						<div>
							<strong><i component="topic/pinned" class="fa fa-thumb-tack<!-- IF !topics.pinned --> hide<!-- ENDIF !topics.pinned -->"></i> <i component="topic/locked" class="fa fa-lock<!-- IF !topics.locked --> hide<!-- ENDIF !topics.locked -->"></i></strong>
							<!-- IF !topics.noAnchor -->
							<a class="fs-4" component="topic/header" href="{config.relative_path}/topic/{topics.slug}" itemprop="url" class="topic-title">{topics.title}</a><br />
							<!-- ELSE -->
							<a class="fs-4" component="topic/header" itemprop="url" class="topic-title">{topics.title}</a><br />
							<!-- ENDIF !topics.noAnchor -->

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
					<strong class="human-readable-number fs-3" title="{topics.votes}">{topics.votes}</strong><br />
					<small class="text-muted">[[global:votes]]</small>
				</div>

				<div class="col-1 text-center category-stat hidden-xs stats-postcount">
					<strong class="human-readable-number fs-3" title="{topics.postcount}">{topics.postcount}</strong><br />
					<small class="text-muted">[[global:posts]]</small>
				</div>

				<div class="col-1 text-center category-stat hidden-xs stats-viewcount">
					<strong class="human-readable-number fs-3" title="{topics.viewcount}">{topics.viewcount}</strong><br />
					<small class="text-muted">[[global:views]]</small>
				</div>

				<div class="col-2 category-stat replies hidden-sm hidden-xs d-flex align-items-center" component="topic/teaser">
					{{{ if topics.unreplied }}}
					<p class="no-replies"><a href="{config.relative_path}/topic/{topics.slug}" itemprop="url">[[category:no_replies]]</a></p>
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
