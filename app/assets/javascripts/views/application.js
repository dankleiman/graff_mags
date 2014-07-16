App.ApplicationView = Ember.View.extend({
  initFoundation: function(){
    this.$(document).foundation();
    console.log('Initiated Foundation');
 }.on('didInsertElement')
});
