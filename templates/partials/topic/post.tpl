<li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
	<a component="post/anchor" data-index="{./index}" id="{increment(./index, "1")}"></a>
	<div class="post-row">

		<meta itemprop="datePublished" content="{posts.timestampISO}">
		<meta itemprop="dateModified" content="{posts.editedISO}">

		<div class="topic-item">
			<div class="topic-body">
				<div class="row">
					<div class="col-md-12">
						<div class="topic-profile-pic d-none d-lg-flex flex-column align-items-center sticky-top" style="top: 6rem; z-index: 1;">
							<div class="d-flex flex-column align-items-center">
								<a class="d-block img-thumbnail rounded-circle" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
									{buildAvatar(./user, "70px", false, "", "user/picture")}
								</a>

								<small class="username text-center" title="{posts.user.username}" style="max-width: 70px;"><a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">{./user.username}</a></small>
							</div>
							<div>
								{{{ if posts.user.banned }}}
								<div class="text-center">
									<span class="badge bg-danger">[[user:banned]]</span>
								</div>
								{{{ end }}}
							</div>
						</div>

						<div class="topic-text">
							<!-- IF @first -->
							<h1 class="topic-title">
								<div component="post/header" class="topic-title" itemprop="name">
									<div component="topic/labels" class="d-inline-flex gap-2 {{{ if (!scheduled && (!pinned && (!locked && (!oldCid && !icons.length)))) }}}hidden{{{ end }}}">
										<i component="topic/scheduled" class="fa fa-clock-o <!-- IF !scheduled -->hidden<!-- ENDIF !scheduled -->" title="[[topic:scheduled]]"></i>
										<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF (scheduled || !pinned) -->hidden<!-- ENDIF (scheduled || !pinned) -->" title="{{{ if !pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {pinExpiryISO}]]{{{ end }}}"></i>
										<i component="topic/locked" class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->" title="[[topic:locked]]"></i>
										<i class="fa fa-arrow-circle-right <!-- IF !oldCid -->hidden<!-- ENDIF !oldCid -->" title="{{{ if privileges.isAdminOrMod }}}[[topic:moved-from, {oldCategory.name}]]{{{ else }}}[[topic:moved]]{{{ end }}}"></i>
										{{{each icons}}}{@value}{{{end}}}
									</div>
									<span component="topic/title">{title}</span>
								</div>
								<hr>
							</h1>
							<!-- ENDIF @first -->
							<div class="d-flex d-lg-none mb-2">
								<div class="d-flex gap-2 align-items-center text-sm">
									<a class="d-block rounded-circle" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
										{buildAvatar(./user, "20px", false, "", "user/picture")}
									</a>

									<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" class="username text-center text-nowrap" title="{posts.user.username}" style="max-width: 70px;">{./user.username}</a>
								</div>
							</div>
							<div component="post/content" class="post-content" itemprop="text">{posts.content}</div>
							<!-- IF posts.user.signature -->
							<div class="post-signature">{posts.user.signature}</div>
							<!-- ENDIF posts.user.signature -->
						</div>
					</div>
				</div>
			</div>

			<div class="topic-footer d-flex flex-wrap gap-2 justify-content-between border-top align-items-center p-2">
				<div class="d-flex gap-3 align-items-center">
					<div class="dropdown moderator-tools" component="post/tools">
						<a href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-fw fa-gear"></i></a>
						<ul class="dropdown-menu p-1" role="menu"></ul>
					</div>

					<!-- IF !reputation:disabled -->
					<a component="post/upvote" href="#" class="upvote<!-- IF posts.upvoted --> upvoted<!-- ENDIF posts.upvoted -->">
						<i class="fa fa-chevron-up"></i>
					</a>
					<span component="post/vote-count" class="votes" data-votes="{posts.votes}">{posts.votes}</span>
					<!-- IF !downvote:disabled -->
					<a component="post/downvote" href="#" class="downvote<!-- IF posts.downvoted --> downvoted<!-- ENDIF posts.downvoted -->">
						<i class="fa fa-chevron-down"></i>
					</a>
					<!-- ENDIF !downvote:disabled -->
					<!-- ENDIF !reputation:disabled -->

					<!-- IF posts.user.custom_profile_info.length -->
						{{{ each custom_profile_info}}}
						&bull; {posts.user.custom_profile_info.content}
						{{{ end }}}
					<!-- ENDIF posts.user.custom_profile_info.length -->
					<span class="d-flex flex-nowrap gap-2 post-tools">
						<!-- IF !posts.selfPost -->
						<!-- IF posts.user.userslug -->
						<!-- IF loggedIn -->
						<!-- IF !config.disableChat -->
						<button component="post/chat" class="btn btn-sm btn-link chat" type="button" title="[[topic:chat]]"><i class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></button>
						<!-- ENDIF !config.disableChat -->
						<!-- ENDIF loggedIn -->
						<!-- ENDIF posts.user.userslug -->
						<!-- ENDIF !posts.selfPost -->

						<button component="post/quote" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i><span class="hidden-xs-inline"> [[topic:quote]]</span></button>
						<button component="post/reply" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button"><i class="fa fa-reply"></i><span class="hidden-xs-inline"> [[topic:reply]]</span></button>
					</span>
				</div>
				<div class="d-none d-lg-flex pe-3 text-xs">
					<div class="d-flex gap-2 align-items-center flex-nowrap">
						{{{ if posts.user.userslug }}}
						<span component="user/status" class="d-inline-block border border-white border-2 rounded-circle status {posts.user.status}"><span class="visually-hidden">[[global:{posts.user.status}]]</span></span>
						{{{ end }}}
						<span class="text-nowrap" data-username="{posts.user.username}" data-uid="{posts.user.uid}">
							<!-- IF posts.user.uid -->
							<strong><a href="{config.relative_path}/user/{posts.user.userslug}" itemprop="author">{posts.user.username}</a></strong> &bull; <span class="timeago" title="{posts.timestampISO}"></span>
							<!-- ELSE -->
							[[global:guest]] | <span class="timeago" title="{posts.timestampISO}"></span>
							<!-- ENDIF posts.user.uid -->
						</span>
					</div>

					<span component="post/editor" class="text-nowrap {{{ if !posts.editor.username }}} hidden{{{ end }}}">, [[global:last-edited-by, {posts.editor.username}]] <span class="timeago" title="{isoTimeToLocaleString(posts.editedISO, config.userLang)}"></span></span>
				</div>
			</div>
		</div>
	</div>
	<!-- IF !posts.index -->
	<div class="clearfix">
		<div class="post-bar-placeholder"></div>
	</div>
	<!-- ENDIF !posts.index -->
</li>