$(document).ready(function() {
    GetCategoryLv1();
});

function GetCategoryLv1() {
    $.ajax({
        type: "POST",
        url: "/View/DoAction.asmx/GetCateGory",
        data: JSON.stringify({ CatParent: '0' }), // the data in JSON format.  Note it is *not* a JSON object, is is a literal string in JSON format
        contentType: "application/json; charset=utf-8", // we are sending in JSON format so we need to specify this
        dataType: "json", // the data type we want back.  The data will come back in JSON format
        success: function (data) {
            var html = '<li class="current"><a href="Main.aspx">Home</a></li>';
            if (data.d != "") {
                var Menus = JSON.parse(data.d);
                for (i = 0; i < Menus.length; i++) {
                    var obj = Menus[i];
                    html += '<li id="menu'+obj.ID+'"><a href="' + obj.path + '">' + obj.CategoryName + '</a></li>';
                }
            }
            $("#nav").append(html);
            //$("#searchresultsB").html(data.d); // it's a quirk, but the JSON data comes back in a property called "d"; {"d":"Hello Aidy F"}
        }
    });
}



