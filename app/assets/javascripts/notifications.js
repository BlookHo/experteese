/* Notifcations wrapper
-------------------------------*/
var Notification = (function(){

  var types = {};

  types.alert = function(message){
    noty({
        text: message,
        layout: 'bottomRight',
        theme: 'relax',
        type: 'error',
        animation: {
            open: 'animated flipInX', // Animate.css class names
            close: 'animated flipOutX', // Animate.css class names
        }
    });
  };


  types.notice = function(message){
    noty({
        text: message,
        layout: 'bottomRight',
        theme: 'relax',
        type: 'success',
        animation: {
            open: 'animated flipInX',
            close: 'animated flipOutX',
        }
    });
  };


  types.warning = function(message){
    noty({
        text: message,
        layout: 'bottomRight',
        theme: 'relax',
        type: 'warning',
        animation: {
            open: 'animated flipInX',
            close: 'animated flipOutX',
        }
    });
  };


  types.info = function(message){
    noty({
        text: message,
        layout: 'bottomRight',
        theme: 'relax',
        type: 'alert',
        animation: {
            open: 'animated flipInX',
            close: 'animated flipOutX',
        }
    });
  };

  return types;

}(Notification));
