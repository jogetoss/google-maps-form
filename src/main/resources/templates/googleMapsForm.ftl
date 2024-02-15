<div class="form-cell" ${elementMetaData!}>

    <#if (element.properties.apiKey)??>
        <script src="https://maps.googleapis.com/maps/api/js?key=${element.properties.apiKey}" async defer></script>
    </#if>

    <script type="text/javascript" src="${request.contextPath}/plugin/org.joget.GoogleMapsForm/js/googleMapsForm.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugin/org.joget.GoogleMapsForm/css/googleMapsForm.css">
    <input required type="hidden" name="Coordinates" id="coordinate" <#if (element.properties.lon)?? && (element.properties.lat)??>value=" ${element.properties.lat}, ${element.properties.lon}"</#if> readonly/>
    <input type="hidden" id="markerName" <#if (element.properties.markerName)??>value="${element.properties.markerName}" </#if> readonly/>
    <button id="getLocationAdv">Show location</button>
    <br>
    <br>
    <div id="mapholder2"></div>

    
</div>