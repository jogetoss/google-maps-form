<div class="form-cell" ${elementMetaData!}>

    <#if (element.properties.apiKey)??>
        <script src="https://maps.googleapis.com/maps/api/js?key=${element.properties.apiKey}" async defer></script>
    </#if>

    <script type="text/javascript" src="${request.contextPath}/plugin/org.joget.GoogleMapsForm/js/googleMapsForm.js"></script>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugin/org.joget.GoogleMapsForm/css/googleMapsForm.css">

    <label class="label"> </label>
    <button id="getLocation">Get My Location</button>

    <p id="result"></p>

    <div id="mapholder1"></div>
    <div id="mapholder2"></div>

    <label for="title" class="label">Title</label>
    <input required type="text" name="Title" id="title"/>

    <label for="coordinate" class="label">Coordinates</label>
    <input required type="text" name="Coordinates" id="coordinate" <#if (element.properties.lon)?? && (element.properties.lat)??>value="${element.properties.lon}, ${element.properties.lat}"</#if> readonly/>

    <label class="label"> </label>
    <button id="getLocationAdv">Refresh map based on new coordinates</button>
    
</div>