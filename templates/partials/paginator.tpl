		<div class="text-center">
			<ul class="pagination pagination-lg">
				<li class="previous pull-left <!-- IF !paginate.prev.active -->disabled<!-- ENDIF !paginate.prev.active -->">
					<a href="?page={paginate.prev.page}"><i class="fa fa-chevron-left"></i> </a>
				</li>
				<!-- BEGIN pages -->
					<li class="page <!-- IF pages.active -->active<!-- ENDIF pages.active -->">
						<a href="?page={pages.page}">{pages.page}</a>
					</li>
				<!-- END pages -->

				<li class="next pull-right <!-- IF !paginate.next.active -->disabled<!-- ENDIF !paginate.next.active -->">
					<a href="?page={paginate.next.page}"> <i class="fa fa-chevron-right"></i></a>
				</li>
			</ul>
		</div>
