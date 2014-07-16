App.IssuesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('issue');
  },
  actions: {
    openModal: function(content){
      console.log('openModal from issues.js');
      this.controllerFor('reveal').set('content', content);
      $('#issueModal').reveal();
    }
  }
});
