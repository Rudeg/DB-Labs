<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <title>Lab 5, DB</title>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="js/scrpit.js"></script>
</head>
<body>
    <div class="center">
        <h1>${title}</h1>
        <textarea readonly="true" id="textview"></textarea>
        <br>
        <button class="btn btn-default" onclick="SelectFromApi()">Run select tests</button>
        <button class="btn btn-default" onclick="UpdateFromApi()">Run update tests</button>
        <button class="btn btn-default" onclick="ProcedureFromApi()">Run procedure</button>
    </div>
</body>
</html>
