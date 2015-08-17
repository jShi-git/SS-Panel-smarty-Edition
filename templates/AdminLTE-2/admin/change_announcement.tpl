<{include file='admin/main.tpl'}>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        
        <h1>
            修改公告
            <small>Change announcement</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">修改<{$announcement_title}></h3>
                    </div><!-- /.box-header -->
                    <{if $announcement_name!=null}>
                        <div class="box-body">
                            <form role="form" method="post" action="javascript:submit();">
                                <div class="form-group">
                                   <{textareaCodemirror name="new_content" id="new_content" class="textarea"}><{$original_content}><{/textareaCodemirror}>
                                </div>
                                <div class="box-footer">
                                    <button type="Submit" id="Submit" name="action" value="edit" class="btn btn-primary">修改</button>
                                </div>
                            </form>
                        </div><!-- /.box-body -->
                    <{else}>
                        <div class="box-body">
                            没有这个公告名称
                        </div><!-- /.box-body -->
                    <{/if}>
                        <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
                            <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-info"></i> 成功!</h4>
                            <p id="msg-success-p"></p>
                        </div>
                        <div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
                            <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-warning"></i> 出错了!</h4>
                            <p id="msg-error-p"></p>
                        </div>
                </div>
            </div><!-- /.box -->
        </div>   <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<{include file='Public_javascript.tpl'}>
<!-- 在下面添加功能引用的js -->

<script>
function submit(){
    $.ajax({
            type:"POST",
            url:"_change_announcement.php",
            dataType:"json",
            data:{
                announcement_name: "<{$announcement_name}>",
                new_content: $("#new_content").val()
            },
        success:function(data){
            if(data.ok){
                $("#msg-error").hide(10);
                $("#msg-success").hide(10);
                $("#msg-success").show(100);
                $("#msg-success-p").html(data.msg);
            }else{
                $("#msg-error").show(100);
                $("#msg-error-p").html(data.msg);
            }
        },
        error:function(jqXHR){
            $("#msg-error").hide(10);
            $("#msg-error").show(100);
            $("#msg-error-p").html("发生错误："+jqXHR.status);
        }
    })
}
$("#ok-close").click(function(){
    $("#msg-success").hide(100);
})
$("#error-close").click(function(){
    $("#msg-error").hide(100);
})
</script>
<{include file='user/footer.tpl'}>