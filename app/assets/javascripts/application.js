// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-ja
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require cocoon
//= require spin
//= require jquery.spin
//= require_tree .

function submit_confirm() {
  var opts = {
    lines: 12,        // The number of lines to draw
    length: 7,        // The length of each line
    width: 9,         // The line thickness
    radius: 30,       // The radius of the inner circle
    color: '#000',    // #rgb or #rrggbb
    speed: 1,         // Rounds per second
    trail: 60,        // Afterglow percentage
    className: 'spinner', // The CSS class to assign to the spinner
    top: '0', // Top position relative to parent
    left: '0', // Left position relative to parent
    shadow: 'false', // Box-shadow for the lines
    position: 'fixed' // Element positioning
  };
  // 描画先の親要素
  var spin_target = document.getElementById('container');
  // スピナーオブジェクト
  var spinner = new Spinner(opts);
  // スピナー描画
  spinner.spin(spin_target);  
  return true;
}
 
$(document).ready(function(){
  $('#spin').click(function(){
    $(this).spin();
  })
});