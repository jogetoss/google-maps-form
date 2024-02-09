<div class="form-cell" ${elementMetaData!}>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGppYvsQoQn6_jDBaBpZBeij1uVxwVBqs" async defer></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/org.joget.GoogleMapsForm/js/googleMapsForm.js"></script>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugin/org.joget.GoogleMapsForm/css/googleMapsForm.css">

    <label class="label"> </label>
    <button id="getLocation">Get My Location</button>

    <p id="result"></p>

    <div id="mapholder1"></div>
    <div id="mapholder2"></div>

    <label class="label">Title</label>
    <input type="text" name="Title" id="title"/>

    <label class="label">Coordinates</label>
    <input type="text" name="Coordinates" id="coordinate"/>

    <label class="label"> </label>
    <button id="getLocationAdv">Refresh map based on new coordinates</button>
</div>