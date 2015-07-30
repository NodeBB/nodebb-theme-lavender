

<div class="account-username-box" data-userslug="{userslug}" data-uid="{uid}">
	<ul class="nav nav-pills account-sub-links">
		<li>
			<a href="#" type="button" class="dropdown-toggle inline-block" data-toggle="dropdown">
				[[user:more]]
				<span class="caret"></span>
				<span class="sr-only">Toggle Dropdown</span>
			</a>
			<ul class="dropdown-menu pull-right" role="menu">
				<li><a href="{config.relative_path}/user/{userslug}/following"><i class="fa fa-fw fa-users"></i> [[user:following]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/followers"><i class="fa fa-fw fa-users"></i> [[user:followers]]</a></li>
				<li class="divider"></li>
				<li><a href="{config.relative_path}/user/{userslug}/topics"><i class="fa fa-fw fa-book"></i> [[global:topics]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/posts"><i class="fa fa-fw fa-pencil"></i> [[global:posts]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/groups"><i class="fa fa-fw fa-users"></i> [[global:header.groups]]</a></li>
				<!-- IF showHidden -->
				<li><a href="{config.relative_path}/user/{userslug}/favourites"><i class="fa fa-fw fa-heart"></i> [[user:favourites]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/watched"><i class="fa fa-fw fa-eye"></i> [[user:watched]]</a></li>
				<!-- ENDIF showHidden -->
				<!-- BEGIN profile_links -->
				<li id="{profile_links.id}" class="plugin-link <!-- IF profile_links.public -->public<!-- ELSE -->private<!-- ENDIF profile_links.public -->"><a href="{config.relative_path}/user/{userslug}/{profile_links.route}"><i class="fa fa-fw {profile_links.icon}"></i> {profile_links.name}</a></li>
				<!-- END profile_links -->
			</ul>
		</li>
		<li>
			<a href="{config.relative_path}/user/{userslug}" class="inline-block" id="profile"><i class="fa fa-user"></i> [[user:profile]]</a>
		</li>
		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/settings"><i class="fa fa-gear"></i> [[user:settings]]</a></li>
		<!-- ENDIF showHidden -->
	</ul>
</div>

<div class="favourites">

	<!-- IF !posts.length -->
	<div class="alert alert-info">[[user:has_no_posts]]</div>
	<!-- ENDIF !posts.length -->

	<div class="row">
<ul component="posts" class="posts-list" data-nextstart="{nextStart}">

	<!-- BEGIN posts -->
	<li component="post" class="posts-list-item" data-pid="{posts.pid}" data-uid="{posts.uid}">

		<div class="panel panel-default">
			<div class="panel-body">
				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<img title="{posts.user.username}" class="img-rounded user-img" src="{posts.user.picture}">
				</a>

				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<strong><span>{posts.user.username}</span></strong>
				</a>
				<div component="post/content" class="content">
					<p>{posts.content}</p>
					<p class="fade-out"></p>
				</div>
				<small>
					<span class="pull-right">
						[[global:posted_in_ago, <a href="{config.relative_path}/category/{posts.category.slug}"><i class="fa {posts.category.icon}"></i> {posts.category.name}</a>, <span class="timeago" title="{posts.relativeTime}"></span>]] &bull;
						<a href="{config.relative_path}/topic/{posts.topic.slug}/{posts.index}">[[global:read_more]]</a>
					</span>
				</small>
			</div>
		</div>

	</li>
	<!-- END posts -->
</ul>
<div component="posts/loading" class="loading-indicator text-center hidden">
	<i class="fa fa-refresh fa-spin"></i>
</div>
		<!-- IF config.usePagination -->

<div class="text-center pagination-container<!-- IF !pagination.pages.length --> hidden<!-- ENDIF !pagination.pages.length -->">
	<ul class="pagination">
		<li class="previous pull-left<!-- IF !pagination.prev.active --> disabled<!-- ENDIF !pagination.prev.active -->">
			<a href="?{pagination.prev.qs}" data-page="{pagination.prev.page}"><i class="fa fa-chevron-left"></i> </a>
		</li>

		<!-- BEGIN pages -->
			<!-- IF pagination.pages.separator -->
			<li class="page select-page">
				<a href="#"><i class="fa fa-ellipsis-h"></i></a>
			</li>
			<!-- ELSE -->
			<li class="page<!-- IF pagination.pages.active --> active<!-- ENDIF pagination.pages.active -->" >
				<a href="?{pagination.pages.qs}" data-page="{pagination.pages.page}">{pagination.pages.page}</a>
			</li>
			<!-- ENDIF pagination.pages.separator -->
		<!-- END pages -->

		<li class="next pull-right<!-- IF !pagination.next.active --> disabled<!-- ENDIF !pagination.next.active -->">
			<a href="?{pagination.next.qs}" data-page="{pagination.next.page}"> <i class="fa fa-chevron-right"></i></a>
		</li>
	</ul>
</div>

		<!-- ENDIF config.usePagination -->
	</div>
</div>

<input type="hidden" template-variable="yourid" value="{yourid}" />
<input type="hidden" template-variable="theirid" value="{theirid}" />