
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'CS 4.1, DB Lab #4, Kharkiv Aviation Institute' });
};