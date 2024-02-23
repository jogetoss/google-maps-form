<div class="form-cell" ${elementMetaData!}>

    <#if (element.properties.apiKey)??>
        <script src="https://maps.googleapis.com/maps/api/js?key=${element.properties.apiKey}" async defer></script>
    </#if>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugin/org.joget.GoogleMapsForm/css/googleMapsForm.css">
    <script>
        window.onload = function() {
            initMap(); 
        }
        function initMap() {

                var markers = [];

            <#if element.properties.addMarker??>
                <#list element.properties.addMarker as marker>
                    
                    var lat = ${marker.lat};
                    var lon = ${marker.lon};
                    var name = "${marker.markerName}";
                    
                    var marker = new google.maps.Marker({
                    position: {lat: lat, lng: lon},
                    title: name
                    });
                    
                    markers.push(marker);

                </#list>
            </#if>

                //show the map
                map = new google.maps.Map(document.getElementById("mapholder2"), {
                    center: {
                        lat: lat,
                        lng: lon
                    },
                    zoom: 15
                });

            // then to add the markers to the map
            for(var i = 0; i < markers.length; i++) {
                markers[i].setMap(map); 
            }
        }
    </script>
    <div id="mapholder2"></div>

    
</div>