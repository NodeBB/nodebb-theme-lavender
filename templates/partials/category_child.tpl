<!-- IF ../isSection -->
<div component="categories/category" class="col-12 category-item">
	<h1 class="section">{../name}</h1>
</div>
<!-- ELSE -->
<div component="categories/category" class="<!-- IF ../class -->{../class}<!-- ELSE -->col-md-3 col-sm-6 col-12<!-- ENDIF ../class --> category-item" data-cid="{../cid}" data-numRecentReplies="{../numRecentReplies}">
	<meta itemprop="name" content="{../name}">

	<div class="category-icon">
		<!-- IF ../link -->
		<a style="color: {../color};" href="{../link}" itemprop="url">
		<!-- ELSE -->
		<a style="color: {../color};" href="{config.relative_path}/category/{../slug}" itemprop="url">
		<!-- ENDIF ../link -->
			<div
				id="category-{../cid}" class="position-relative category-header category-header-image-{../imageClass}"
				style="
					<!-- IF ../backgroundImage -->background-image: url({../backgroundImage});<!-- ENDIF ../backgroundImage -->
					<!-- IF ../bgColor -->background-color: {../bgColor};<!-- ENDIF ../bgColor -->
					color: {../color};
				"
			>
				<!-- IF !../link -->
				<span class="badge {../unread-class}"><i class="fa fa-book" data-bs-toggle="tooltip" title="[[global:topics]]"></i> <span class="human-readable-number" title="{../totalTopicCount}">{../totalTopicCount}</span>&nbsp; <i class="fa fa-pencil" data-bs-toggle="tooltip" title="[[global:posts]]"></i> <span class="human-readable-number" title="{../totalPostCount}">{../totalPostCount}</span></span>
				<!-- ENDIF !../link -->

				<!-- IF ../icon -->
				<div><i class="fa {../icon} fa-4x"></i></div>
				<!-- ENDIF ../icon -->
			</div>
		</a>

		<div class="category-box">
			<div class="category-info">
				<!-- IF ../link -->
				<a href="{../link}" itemprop="url">
				<!-- ELSE -->
				<a href="{config.relative_path}/category/{../slug}" itemprop="url">
				<!-- ENDIF ../link -->
					<h4 class="text-truncate"><!-- IF ../icon --><i class="fa {../icon} visible-xs-inline"></i> <!-- ENDIF ../icon -->{../name}</h4>
				</a>
				<div class="description ms-0" itemprop="description">{../descriptionParsed}</div>
			</div>

			<!-- IF !../link -->
			{{{ each ./posts }}}
			<div component="category/posts" class="post-preview clearfix">
				<strong><a href="{config.relative_path}/topic/{../topic.slug}">{../topic.title}</a></strong>
				<hr/>
				<a class="float-start me-2" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
					{buildAvatar(./user, "24px", true)}
				</a>
				<div class="post-preview-content">
					<div class="content">
					{../content}
					</div>
					<p class="fade-out"></p>
				</div>

				<span class="pull-right post-preview-footer">
					<span class="timeago" title="{../timestampISO}"></span> &bull;
					<a href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">[[global:read_more]]</a>
				</span>
			</div>
			{{{ end }}}
			<!-- ENDIF !../link -->
		</div>
	</div>
</div>
<!-- ENDIF ../isSection -->