App.Issue = DS.Model.extend({
  title: DS.attr('string'),
  location: DS.attr('string'),
  year: DS.attr('number'),
  frontCover: DS.attr('string'),
  backCover: DS.attr('string'),
  featuredImage: DS.attr('string'),
  subtitle: DS.attr('string'),
  issue_number: DS.attr('number'),
  magazineId: DS.attr('number'),
  featuredImageThumb: DS.attr('string')
});
