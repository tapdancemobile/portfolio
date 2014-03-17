
jQuery(document).ready(function($){
var 
speed = 500,   // animation speed
$wall = $('#portfolio').find('.portfolio-grid ul')
;

$wall.masonry({
singleMode: true,

// only apply masonry layout to visible elements
itemSelector: '.col3:not(.invis)',
animate: true,
animationOptions: {
duration: speed,
queue: false
}
});

$('#filterable a').click(function(){
var colorClass = '.' + $(this).attr('class');

if(colorClass=='.all') {
// show all hidden boxes
$wall.children('.invis')
.toggleClass('invis').fadeIn(speed);
} else {  
// hide visible boxes 
$wall.children().not(colorClass).not('.invis')
.toggleClass('invis').fadeOut(speed);
// show hidden boxes
$wall.children(colorClass+'.invis')
.toggleClass('invis').fadeIn(speed);
}
$wall.masonry();

 return false;
});

});
