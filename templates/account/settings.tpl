
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

<div class="account">
	<div class="row">
		<div class="col-xs-12">
			<h4>[[user:browsing]]</h4>
			<div class="well">
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="openOutgoingLinksInNewTab" <!-- IF settings.openOutgoingLinksInNewTab -->checked<!-- ENDIF settings.openOutgoingLinksInNewTab -->/> <strong>[[user:open_links_in_new_tab]]</strong>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="topicSearchEnabled" <!-- IF settings.topicSearchEnabled -->checked<!-- ENDIF settings.topicSearchEnabled -->/> <strong>[[user:enable_topic_searching]]</strong>
					</label>
				</div>
				<p class="help-block">[[user:topic_search_help]]</p>
			</div>

			<h4>[[global:privacy]]</h4>
			<div class="well">
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="showemail" <!-- IF settings.showemail -->checked <!-- ENDIF settings.showemail -->/> <strong>[[user:show_email]]</strong>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="showfullname" <!-- IF settings.showfullname -->checked<!-- ENDIF settings.showfullname -->/> <strong>[[user:show_fullname]]</strong>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="restrictChat" <!-- IF settings.restrictChat -->checked<!-- ENDIF settings.restrictChat -->/> <strong>[[user:restrict_chats]]</strong>
					</label>
				</div>
			</div>

			<!-- IF !disableEmailSubscriptions -->
			<h4>[[global:email]]</h4>
			<div class="well">
				<div class="form-group">
					<label for="dailyDigestFreq">[[user:digest_label]]</label>
					<select class="form-control" id="dailyDigestFreq" data-property="dailyDigestFreq">
						<!-- BEGIN dailyDigestFreqOptions -->
						<option value="{dailyDigestFreqOptions.value}" <!-- IF dailyDigestFreqOptions.selected -->selected<!-- ENDIF dailyDigestFreqOptions.selected -->>{dailyDigestFreqOptions.name}</option>
						<!-- END dailyDigestFreqOptions -->
					</select>
					<p class="help-block">[[user:digest_description]]</p>
				</div>

				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="sendChatNotifications" <!-- IF settings.sendChatNotifications -->checked<!-- ENDIF settings.sendChatNotifications -->/> <strong>[[user:send_chat_notifications]]</strong>
					</label>
				</div>

				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="sendPostNotifications" <!-- IF settings.sendPostNotifications -->checked<!-- ENDIF settings.sendPostNotifications -->/> <strong>[[user:send_post_notifications]]</strong>
					</label>
				</div>
			</div>
			<!-- ENDIF !disableEmailSubscriptions -->

			<h4>[[user:follow]]</h4>
			<div class="well">
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="followTopicsOnCreate" <!-- IF settings.followTopicsOnCreate -->checked <!-- ENDIF settings.followTopicsOnCreate -->/> <strong>[[user:follow_topics_you_create]]</strong>
					</label>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="followTopicsOnReply" <!-- IF settings.followTopicsOnReply -->checked<!-- ENDIF settings.followTopicsOnReply -->/> <strong>[[user:follow_topics_you_reply_to]]</strong>
					</label>
				</div>
			</div>

			<h4>[[groups:groups]]</h4>
			<div class="well">
				<div class="form-group">
					<label for="grouptitle">[[user:grouptitle]]</label>
					<select class="form-control" id="grouptitle" data-property="groupTitle">
						<option value="">[[user:no-group-title]]</option>
						<!-- BEGIN userGroups -->
						<!-- IF userGroups.userTitleEnabled -->
						<option value="{userGroups.name}" <!-- IF userGroups.selected -->selected<!-- ENDIF userGroups.selected -->>{userGroups.userTitle}</option>
						<!-- ENDIF userGroups.userTitleEnabled -->
						<!-- END userGroups -->
					</select>
				</div>
			</div>


			<h4>[[global:pagination]]</h4>
			<div class="well">
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="usePagination" <!-- IF settings.usePagination -->checked<!-- ENDIF settings.usePagination -->> <strong>[[user:paginate_description]]</strong>
					</label>
				</div>

				<strong>[[user:topics_per_page]]</strong><br /> <input type="text" class="form-control" data-property="topicsPerPage" value="{settings.topicsPerPage}"><br />
				<strong>[[user:posts_per_page]]</strong><br /> <input type="text" class="form-control" data-property="postsPerPage" value="{settings.postsPerPage}"><br />
			</div>

			<h4>[[global:header.notifications]]</h4>
			<div class="well">
				<div class="checkbox">
					<label>
						<input type="checkbox" data-property="notificationSounds" <!-- IF settings.notificationSounds -->checked<!-- ENDIF settings.notificationSounds -->> <strong>[[user:notification_sounds]]</strong>
					</label>
				</div>
			</div>

			<h4>[[global:language]]</h4>
			<div class="well">
				<select data-property="userLang" class="form-control">
					<!-- BEGIN languages -->
					<option value="{languages.code}" <!-- IF languages.selected -->selected<!-- ENDIF languages.selected -->>{languages.name} ({languages.code})</option>
					<!-- END languages -->
				</select>
			</div>


			<!-- BEGIN customSettings -->
			<h4>{customSettings.title}</h4>
			<div class="well">
				{customSettings.content}
			</div>
			<!-- END customSettings -->
		</div>
	</div>

	<div class="form-actions">
		<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
	</div>
</div>

<input type="hidden" template-variable="yourid" value="{yourid}" />
<input type="hidden" template-variable="theirid" value="{theirid}" />