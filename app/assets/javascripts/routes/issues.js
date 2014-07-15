App.IssuesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('issue');
  },
  actions: {
    openModal: function(modal){
      return this.render(modal, {
        into: 'issues',
        outlet: 'modal'
      });
    },
    closeModal: function(){
      return this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'issues'
      });
    }
  }
});
