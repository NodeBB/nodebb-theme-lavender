

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

<div class="users account">

	<ul id="users-container" class="users-container" data-nextstart="{nextStart}">
<!-- BEGIN users -->
<li class="users-box registered-user" data-uid="{users.uid}">
	<a href="{config.relative_path}/user/{users.userslug}"><img src="{users.picture}" class="img-thumbnail"/></a>
	<br/>
	<div class="user-info">
		<span>
			<i component="user/status" class="fa fa-circle status {users.status}" title="[[global:{users.status}]]"></i>
			<a href="{config.relative_path}/user/{users.userslug}">{users.username}</a>
		</span>
		<br/>
		<div title="reputation" class="reputation">
			<i class='fa fa-star'></i>
			<span class='formatted-number'>{users.reputation}</span>
		</div>
		<div title="post count" class="post-count">
			<i class='fa fa-pencil'></i>
			<span class='formatted-number'>{users.postcount}</span>
		</div>
	</div>
</li>
<!-- END users -->
	</ul>

	<!-- IF !users.length -->
	<div class="alert alert-warning">[[user:has_no_follower]]</div>
	<!-- ENDIF !users.length -->
</div>

