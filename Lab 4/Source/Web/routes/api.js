/**
 * Created with JetBrains WebStorm.
 * User: fantastik
 * Date: 9/21/13
 * Time: 7:23 PM
 * To change this template use File | Settings | File Templates.
 */

var pg = require('pg');
var cs = 'postgres://fantastik:123@localhost:5432/dblab4';


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
var updateQuery = 'WITH RECURSIVE t AS \
   (SELECT f_random_salary(10000, 1000) as sal, f_random_date(1000) as hiredate, f_random_string(50) as job\
    UNION ALL\
    SELECT f_random_salary(10000, 1000), f_random_date(1000), f_random_string(50) FROM t)\
    UPDATE idx SET sal=s.sal, hiredate=s.hiredate, job=s.job FROM (SELECT * FROM t LIMIT (SELECT count(1) FROM idx)) AS s RETURNING *;';