(function(){var n,i;i=function(i){var r,t,c;return c=i.parents(".holder"),r=c.children("span.a"),t=c.children("span.b"),r.hide().off("click"),t.css("visibility","visible"),c.find(".btn-warning").click(function(){return i=$(this),n(i),i.parents("form")[0].reset()}),c.find(".btn-success").click(function(){return $(this).parents("form")[0].submit()}),t.find("input").keypress(function(n){var i,r;return i=13,r=$(n.target).parents("form"),n.which===i?r.submit():void 0})},n=function(n){var r,t,c;return c=n.parents(".holder"),r=c.children("span.a"),t=c.children("span.b"),r.show(),t.css("visibility","hidden"),c.find(".btn").off("click"),r.click(function(){return i(n)})},$(function(){return $("span.a","h3, h5").click(function(){return i($(this))})})}).call(this);