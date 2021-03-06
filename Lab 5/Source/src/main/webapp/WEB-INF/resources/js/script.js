function SelectFromApi() {
    Echo('Execute SELECT query');

    RestRequest('/selectTest', function (data) {
        Echo('Query success');

        $.each(data, function (i, theItem) {
            EchoRowData(theItem);
        });
        Echo('');

        ScrollBottom()
    });
}

function UpdateFromApi() {
    Echo('Execute UPDATE query');

    RestRequest('/updateTest', function (data) {
        Echo('Query success');

        EchoRowData(data);
        Echo('');

        ScrollBottom()
    });
}

function ProcedureFromApi() {
    Echo('Execute Procedure');

    RestRequest('/procedure', function (data) {
        Echo('Query success');

        EchoRowData(data);
        Echo('');

        ScrollBottom()
    });
}

function RestRequest(endpoint, success) {
    $.ajax({
            type: "GET",
            url: DefaultUrl() + endpoint,
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: success,
            error: function (msg, url, line) {
                Echo('Query fail\n');

                ScrollBottom()
            }
        });
}

function DefaultUrl() {
    return location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: '');
}

function EchoRowData(item) {
    var row = item.ename.slice(0,10) + '* \t' + item.sal + ' \t' + (new Date(item.hiredate)).toDateString() + ' \t' + item.job.slice(0,10) + '*\n';

    var textView = $('#textview');
    textView.val(textView.val() + row);
}

function Echo(str) {
    var textView = $('#textview');
    textView.val(textView.val() + str + '\n');
}

function ScrollBottom() {
    var textView = $('#textview');
    textView.scrollTop(textView[0].scrollHeight - textView.height());
}
