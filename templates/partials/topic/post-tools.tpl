<!-- IF !posts.selfPost -->
<!-- IF posts.user.userslug -->
<!-- IF loggedIn -->
<!-- IF !config.disableChat -->
<a class="btn btn-sm btn-link chat" title="[[topic:chat]]"><i class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></a>
<!-- ENDIF !config.disableChat -->
<!-- ENDIF loggedIn -->
<!-- ENDIF posts.user.userslug -->
<!-- ENDIF !posts.selfPost -->
<!-- IF privileges.topics:reply -->
<a class="btn btn-sm btn-link quote" title="[[topic:quote]]"><i class="fa fa-quote-left"></i><span class="hidden-xs-inline"> [[topic:quote]]</span></a>
<a class="btn btn-sm btn-link post_reply"><i class="fa fa-reply"></i><span class="hidden-xs-inline"> [[topic:reply]]</span></a>
<!-- ENDIF privileges.topics:reply -->
<!-- IF !posts.selfPost -->
<!-- IF loggedIn -->
<a class="btn btn-sm btn-link flag" title="[[topic:flag_title]]"><i class="fa fa-flag-o"></i><span class="hidden-xs-inline"> [[topic:flag]]</span></a>
<!-- ENDIF loggedIn -->
<!-- ENDIF !posts.selfPost -->
<!-- IF posts.display_moderator_tools -->
	<a class="btn btn-sm btn-link edit" title="[[topic:edit]]"><i class="fa fa-pencil"></i><span class="hidden-xs-inline"> [[topic:edit]]</span></a>
	<a class="btn btn-sm btn-link delete" title="[[topic:delete]]"><i class="fa fa-trash-o"></i><span class="hidden-xs-inline"> [[topic:delete]]</span></a>
	<a class="btn btn-sm btn-link purge <!-- IF !posts.deleted -->hidden<!-- ENDIF !posts.deleted -->" title="[[topic:purge]]"><i class="fa fa-eraser"></i><span class="hidden-xs-inline"> [[topic:purge]]</span></a>
	<!-- IF posts.display_move_tools -->
		<a class="btn btn-sm btn-link move" title="[[topic:move]]"><i class="fa fa-arrows"></i><span class="hidden-xs-inline"> [[topic:move]]</span></a>
	<!-- ENDIF posts.display_move_tools -->
<!-- ENDIF posts.display_moderator_tools -->