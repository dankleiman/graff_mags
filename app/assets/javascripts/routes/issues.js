App.IssuesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('issues');
  }
});
