<div class="form-cell" ${elementMetaData!}>
    <div id="map"></div>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugin/org.joget.GoogleMapsForm/css/googleMapsForm.css">
    <script>
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

        <#if (element.properties.mapWidth)?? && (element.properties.mapHeight)??>
            $("#map").css("width", "${element.properties.mapWidth}" + "px");
            $("#map").css("height", "${element.properties.mapHeight}" + "px");
        </#if>

                //show the map
                map = new google.maps.Map(document.getElementById("map"), {
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
    <#if (element.properties.apiKey)??>
        <script src="https://maps.googleapis.com/maps/api/js?key=${element.properties.apiKey}&loading=async&callback=initMap" async defer></script>
    </#if>
    
</div>