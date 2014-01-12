$(document).on('ready page:load', function(){

var monkeyList = new List('test-list', {
  valueNames: ['name'],
  page: 5,
  plugins: [ ListPagination({}) ] 
});


});