/**
 * Created with JetBrains WebStorm.
 * User: fantastik
 * Date: 9/21/13
 * Time: 7:23 PM
 * To change this template use File | Settings | File Templates.
 */

var pg = require('pg');
var cs = 'postgres://postgres:123@localhost:5432/dblab4';


exports.select = function(req, res){
    SelectQuery(res);
};
exports.update = function(req, res) {
    UpdateQuery(res);
};
exports.procedure = function(req, res) {
    ProcedureQuery(res);
}

function SelectQuery(res) {
    Execute(res, selectQuery);
}

function UpdateQuery(res) {
    Execute(res, updateQuery);
}

function ProcedureQuery(res) {
    Execute(res, procedureQuery);
}

function Execute(res, query) {
    pg.connect(cs, function(err, client, done) {
        if(err) {
            res.write({Error: 'Error fetching client from pool: ' + err})
            res.writeHead(400);
            res.end();
            return;
        }

        client.query(query, function(err, result) {
            done();

            if(err) {
                res.write({Error: 'Error running query: ' + err});
                res.writeHead(400);
            }
            else
                res.write(JSON.stringify(result.rows));

            res.end();
        });
    });
}

var selectQuery = 'SELECT * FROM idx';
var procedureQuery = 'SELECT * FROM f_generate_row() AS rec(ename varchar, sal money, hiredate date, job varchar);';
var updateQuery = 'UPDATE idx SET sal=f_random_salary(10000, 1000), hiredate=f_random_date(1000), job=f_random_string(50) WHERE ename = (SELECT ename FROM idx OFFSET floor(random()*(SELECT count(1) FROM idx)) LIMIT 1) RETURNING *;';