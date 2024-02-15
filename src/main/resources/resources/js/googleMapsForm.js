$(function() {
        $("button#getLocation").click(function(event) {
                event.preventDefault();
                getLocation();
            });

        $("button#getLocationAdv").click(function(event) {
                event.preventDefault();
                showMapAdvanced();
            });

        if($("#coordinate").val() != "") {
            showMapAdvanced();
            convertCoordinate();
        }

        $('#coordinate').on('input', function(e) {
                convertCoordinate();
            });
    });
var x = document.getElementById("result");

function convertCoordinate() {
    lonAbs = parseFloat($("#coordinate").val().split(",")[0]);
    latAbs = parseFloat($("#coordinate").val().split(",")[1]);
    signlat = 1;
    signlon = 1;

    latAbs = Math.abs(Math.round(latAbs * 1000000.));
    lonAbs = Math.abs(Math.round(lonAbs * 1000000.));

    $("input[name='longitud1']").val(Math.floor(latAbs / 1000000) * signlat);
    $("input[name='longitud2']").val(Math.floor(((latAbs/1000000) - Math.floor(latAbs/1000000)) * 60));
    $("input[name='longitud3']").val((Math.floor(((((latAbs/1000000) - Math.floor(latAbs/1000000)) * 60) - Math.floor(((latAbs/1000000) - Math.floor(latAbs/1000000)) * 60)) * 100000) * 60/100000));


    $("input[name='latitud1']").val(Math.floor(lonAbs / 1000000) * signlon);
    $("input[name='latitud2']").val(Math.floor(((lonAbs/1000000) - Math.floor(lonAbs/1000000)) * 60));
    $("input[name='latitud3']").val(Math.floor(((((lonAbs/1000000) - Math.floor(lonAbs/1000000)) * 60) - Math.floor(((lonAbs/1000000) - Math.floor(lonAbs/1000000)) * 60)) * 100000) * 60/100000);
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }

    else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    //x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: "+ position.coords.longitude;
    $("#coordinate").val(position.coords.latitude + "," + position.coords.longitude);
    convertCoordinate();
    showMapAdvanced();
}

var map;

function showMapAdvanced() {
    if($("#coordinate").val() != "") {
            //set the dimension in the holder
            $("#mapholder2").css("width", "500px");
            $("#mapholder2").css("height", "300px");

            //retrieve the coordinate
            coordinateLon = parseFloat($("#coordinate").val().split(",")[0]);
            coordinateLat = parseFloat($("#coordinate").val().split(",")[1]);

            //retrieve marker name
            markerName = $("#markerName").val();

            //show the map
            map = new google.maps.Map(document.getElementById('mapholder2'), {
                center: {
                    lat: coordinateLon,
                    lng: coordinateLat
                },
                zoom: 15
            });

        //add info window
        var coordInfoWindow = new google.maps.InfoWindow();
        coordInfoWindow.setContent(markerName);

        coordInfoWindow.setPosition({
            lat: coordinateLon,
            lng: coordinateLat
        });
    coordInfoWindow.open(map);

    //add marker
    var marker = new google.maps.Marker({
            position: {
                lat: coordinateLon,
                lng: coordinateLat
            },
            map: map,
            title: markerName
        });
    }
}