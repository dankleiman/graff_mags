App.ModalController = Ember.Controller.extend({
  actions: {
    closeModal: function(){
      return this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'issues'
      });
    }
  }
});


