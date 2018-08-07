<div class="hbox stretch wulaui" id="exchange-list">
    <aside class="aside aside-xs b-r">
        <div class="vbox">
            <header class="bg-light header b-b">
                <p>充值状态</p>
            </header>
            <section class="scrollable m-t-xs">
                <ul class="nav nav-pills nav-stacked no-radius" id="type-select">
                    <li class="active">
                        <a href="javascript:;"> 全部 </a>
                    </li>
                    {foreach $types as $k=>$name}
                        <li>
                            <a href="javascript:;" rel="{$k}" > {$name}</a>
                        </li>
                    {/foreach}
                </ul>
            </section>
        </div>
    </aside>
    <section class="vbox">
        <header class="header bg-light clearfix b-b">
            <div class="row m-t-sm">

                <div class="col-xs-12 text-right m-b-xs">
                    <form data-table-form="#table" id="search-form" class="form-inline">
                        <input type="hidden" name="currency" id="currency" value="{$currency}"/>
                        <input type="hidden" name="type" id="type" />
                        <div data-datepicker class="input-group date" data-end="#time1">
                            <input id="time" type="text" style="width: 100px;" class="input-sm form-control"
                                   name="start_time" placeholder="开始时间"/>
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                        <div data-datepicker class="input-group date" data-start="#time">
                            <input id="time1" type="text" style="width: 100px;" class="input-sm form-control"
                                   name="end_time" placeholder="结束时间"/>
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                        <div class="input-group input-group-sm">
                            <input id="search" type="text" name="user_id" class="input-sm form-control" placeholder="UID"
                                   autocomplete="off"/>
                            <span class="input-group-btn">
                                <button class="btn btn-sm btn-info" id="btn-do-search" type="submit">Go!</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </header>
        <section class="w-f">
            <div class="table-responsive">
                <table id="table" data-auto data-table="{'wallet/recharge/data'|app}/{$currency}" data-sort="id,d"
                       style="min-width: 800px">
                    <thead>
                    <tr>

                        <th width="40" data-sort="id,d">编号</th>
                        <th width="60">会员</th>
                        <th width="60">金额</th>
                        <th width="50">类型</th>
                        <th width="80">渠道</th>
                        <th width="100">订单编号</th>
                        <th width="60">状态</th>
                        <th width="100" data-sort="create_time,d">充值时间</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </section>
        <footer class="footer b-t">
            <div data-table-pager="#table" data-limit="10"></div>
        </footer>
    </section>

    <a class="hidden edit-task" id="for-edit-task"></a>
</div>
<script>
	layui.use(['jquery', 'bootstrap', 'wulaui'], function ($) {
		var group = $('#type-select');
		group.find('a').click(function () {
			var me = $(this), mp = me.closest('li');
			if (mp.hasClass('active')) {
				return;
			}
			group.find('li').not(mp).removeClass('active');
			mp.addClass('active');
			$('#type').val(me.attr('rel'));
			$('#search-form').submit();
			return false;
		});



	})
</script>