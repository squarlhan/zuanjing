

(function($){
    var _count = 0;
	var Mynumkb = function(element, options){
        _count++;
        this.count = _count;
        this.$element = $(element);
        this.$element.attr("data-count",this.count);//设置this.element的data-count值为this.count
		this.options = $.extend({},$.fn.mynumkb.defaults, options);
		this.init();
	}
	Mynumkb.prototype = {
	    constructor: Mynumkb, 
		init:function(){
			var me= this;
			me.render();
			me.bind();
            me.initHtml();
		},
		render:function(){
			var me = this;
            me.$eparentNode = me.$element.parent();
		},
		bind:function(){
            var me = this;
            me.$element.on("click",$.proxy(me['_eClick'],me));
          
            $(document).on("mousedown","#mykeyboard"+me.count+" li",$.proxy(me['_limousedown'],me));
            $(document).on("mouseup","#mykeyboard"+me.count+" li",$.proxy(me['_limouseup'],me));
            $(document).on("click","#mykeyboard"+me.count+" li",$.proxy(me['_liclick'],me));
		},
		initHtml:function(){
            var me = this;
            var _html = [
                '<div class="mykb-box " id="mykeyboard'+me.count+'">',
                    '<ul class="num-key clearfix">',
                        '<li class="num">1</li>',
                        '<li class="num">2</li>',
                        '<li class="num">3</li>',
                        '<li class="func exit" charset="utf-8">退出</li>',
                        '<li class="num">4</li>',
                        '<li class="num">5</li>',
                        '<li class="num">6</li>',
                        '<li class="func del" charset="utf-8">退格</li>',
                        '<li class="num">7</li>',
                        '<li class="num">8</li>',
                        '<li class="num">9</li>',
                        '<li class="func clearall" content="charset=UTF-8">清除</li>',
                        '<li class="num">0</li>',
                        '<li class="num">.</li>',
                        '<li class="func sure">确定</li>',
                    '</ul>',
                '</div>',
            ].join("");
            
            $("body").append(_html);
            me.setPosition();
        },
        setPosition:function(){
            var me = this;
            var parentNode = me.$eparentNode;
            var $element = me.$element;
            $("body").css("position","relative");
            var height = $element.outerHeight();//返回element的外部高度
            var width = $element.outerWidth();//返回element的外部宽度
            var position = $element.position();//返回element的top位置与left位置
            var $keyboard = $("#mykeyboard"+me.count);
            
            var ulWidth = $keyboard.outerWidth();//键盘的高度
            
            var ulHeight = $keyboard.outerHeight();//键盘的宽度
            
            
            var left = position.left;
           if(left+width+30<1200){
            $keyboard.css({
               // top:position.top+height-30+"px",
                left:left+width+30+"px"
            });
           }else{
            $keyboard.css({
               // top:position.top+height-30+"px",
                left:left-ulWidth-30+"px"
            });
           }
           if(position.top+height+ulHeight+300>1200){
            $keyboard.css({
               top:position.top-ulHeight-30+"px",
                //left:left-ulWidth-30+"px"
            });
           }else{
            $keyboard.css({
                top:position.top+height-80+"px",
                //left:left-ulWidth-30+"px"
            });
           }
           
        },
        _eClick:function(e){
            var me = this;
            var count = me.$element.data("count");
            var $keyboard = $("#mykeyboard"+count);
            $keyboard.fadeIn(100).siblings(".mykb-box").hide();
        },
        _liclick:function(e){//e.target属性显示哪个DOM触发了事件
            var me = this;
            var $target = $(e.target);
            if($target.hasClass("del")){//退格  hasClass检查是否触发了事件的target包含这一class元素
                me.setValue("del");//执行退格功能
            }else if($target.hasClass("exit")||$target.hasClass("sure")){//退出--确定
                me.close();
            }else if($target.hasClass("clearall")){//清除
                me.$element.val("");
            }else{//输入其他数字
                var str = $target.text();
              //  var reg=RegExp(/./);
                
                    me.setValue("add",str);
                
                
            }
        },
		_limousedown:function(e){
            var me = this;
            var val = $(e.target).html();
            $(e.target).addClass("active").siblings().removeClass("active");
        },
		_limouseup:function(e){
            var me = this;
            var val = $(e.target).html();
            $(e.target).removeClass("active");
            
        },
        setValue:function(type,str){//退格功能
            var me = this;
            var curpos = me.getCursorPosition();//获取光标位置
            var val = me.$element.val();
            var newstr = "";
            if(type == 'add'){
            var flag=true;
                if(((val.length==0)&&(str=="."))){
                    flag=false;
                }
                if(val=='0'){
                    flag=false;
                }
                if(flag==true){
                    if(((str==".")&&(val.indexOf('.')==-1)||(str!='.'))){
                            if(val.indexOf('.')!=-1){
                                var numberOfDian=val.split(".")[1].length;
                                if(numberOfDian>=2){
                                    flag=false;
                                }
                            }
                            if(flag==true){
                                newstr = me.insertstr(val,str,curpos);
                                me.$element.val(newstr);
                                me.$element.textFocus(curpos+1);
                            }
                        
                        
                    }
                }
                
                
            }else if(type == 'del'){
                newstr = me.delstr(val,curpos);
                me.$element.val(newstr);
                me.$element.textFocus(curpos-1);
            }
        	
        },
        insertstr:function(str,insertstr,pos){
            var str = str.toString();
            var newstr = str.substr(0,pos)+''+insertstr+''+str.substr(pos);
            return newstr;
        },
        delstr:function(str,pos){
            var str = str.toString();
            var newstr = "";
            if(pos != 0){
                newstr = str.substr(0,pos-1)+str.substr(pos);
            }else{
                newstr = str;
            }
            return newstr;
        },
        getCursorPosition:function(){//获取光标位置
            var me = this;
            var $element = me.$element[0];
            var cursurPosition=-1;
            if($element.selectionStart!=undefined && $element.selectionStart!=null){//非IE浏览器
                cursurPosition= $element.selectionStart;
            }else{//IE
                var range = document.selection.createRange();
                range.moveStart("character",-$element.value.length);
                cursurPosition=range.text.length;
            }
          //  console.log(cursurPosition);
            return cursurPosition;
        },
        close:function(){
            var me = this;
            var count = me.$element.data("count");
            var $keyboard = $("#mykeyboard"+count);
            $keyboard.fadeOut(100);
            me.$element.attr("isshowkb","false");
        }
	};
	$.fn.mynumkb = function (option) {
	    return this.each(function () {
            var options = typeof option == 'object' ? option : {};
	        var data = new Mynumkb(this, options);
	    })
    }
	$.fn.mynumkb.defaults = {
		
	};
	$.fn.mynumkb.Constructor = Mynumkb;
	
	
})(jQuery);
(function($){
    $.fn.textFocus=function(v){
        var range,len,v=v===undefined?0:parseInt(v);
        this.each(function(){
            if(navigator.userAgent.msie){
                range=this.createTextRange();
                v===0?range.collapse(false):range.move("character",v);
                range.select();
            }else{
                len=this.value.length;
                v===0?this.setSelectionRange(len,len):this.setSelectionRange(v,v);
            }
            this.focus();
        });
        return this;
    }
})(jQuery);

