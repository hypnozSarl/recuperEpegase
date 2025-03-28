<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>


<f:subview id="Vide">

    <a4j:form>

        <title>scanner.js Cross-Browser HTML/JavaScript Scanning</title>

        <script type="text/javascript" src="http://direct.asprise.com/scan/javascript/base/scanner.js"></script> <!-- required for scanning -->

        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> <!-- optional -->

        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- optional -->
        <style type="text/css">
            img.zoom { margin-right: 4px; }
            body { margin: 20px 10px; }
        </style>

        <script>
            // -------------- Optional status display, depending on JQuery --------------
            function displayStatus(loading, mesg, clear) {
                $('#info').empty(); // jQuery is used
                if(loading) {
                    $('#info').html((clear ? '' : $('#info').html()) + '<p><img src="http://asprise.com/legacy/product/_jia/applet/loading.gif" style="vertical-align: middle;" hspace="8"> ' + mesg + '</p>');
                } else {
                    $('#info').html((clear ? '' : $('#info').html()) + mesg);
                }
            }
            // -------------- scanning related code: independent of any 3rd JavaScript library --------------
            function scanSimple() {
                displayStatus(true, 'Scanning', true);
                com_asprise_scan_request(myCallBackFunc,
                com_asprise_scan_cmd_method_SIMPLE_SCAN, // simple scan without the applet UI
                com_asprise_scan_cmd_return_IMAGES_AND_THUMBNAILS,
                null);
            }
            function scan() {
                displayStatus(true, 'Scanning', true);
                com_asprise_scan_request(myCallBackFunc,
                com_asprise_scan_cmd_method_SCAN, // normal scan with the applet UI
                com_asprise_scan_cmd_return_IMAGES_AND_THUMBNAILS,
                {
                    'wia-version': 2
                });
            }
            function scanAndSaveToLocal() {
                displayStatus(true, 'Scanning', true);
                com_asprise_scan_request(myCallBackFunc,
                com_asprise_scan_cmd_method_SCAN, // normal scan with the applet UI
                com_asprise_scan_cmd_return_IMAGES_AND_THUMBNAILS,
                {
                    'wia-version': 2,
                    'save-to-folder': 'C:\\tmp\\scanned',
                    'open-folder-after-save': 'true'
                });
            }
            function scanThenUpload() {
                displayStatus(true, 'Scanning', true);
                com_asprise_scan_request(myCallBackFunc,
                com_asprise_scan_cmd_method_SCAN_THEN_UPLOAD, // scan and then upload directly in the applet UI
                com_asprise_scan_cmd_return_IMAGES_AND_THUMBNAILS,
                {
                    'upload-url': 'http://asprise.com/scan/applet/upload.php?action=upload' // target URL
                    ,'format': 'PDF'
                    ,'upload-cookies': document.cookie
                });
            }
            /** Use this callback function to get notified about the scan result. */
            function myCallBackFunc(success, mesg, thumbs, images) {
                var logText;
                displayStatus(false, '', true);
                logText = 'Callback function invoked: success = ' + success + ", mesg = " + mesg;
                logText += '\nThumbs: ' + (thumbs instanceof Array ? thumbs.length : 0) + ", images: " + (images instanceof Array ? images.length : 0);
                logToConsole(logText, !(success || mesg == 'User cancelled.'));
                displayStatus(false, '<pre>' + logText + '</pre>', true);
                for(var i = 0; (images instanceof Array) && i < images.length; i++) {
                    addImage(images[i], document.getElementById('images'));
                }
            }
            /** We use this to track all the images scanned so far. */
            var imagesScanned = [];
            function addImage(imgObj, domParent) {
                imagesScanned.push(imgObj);
                var imgSrc = imgObj.datatype == com_asprise_scan_datatype_BASE64 ?
                    'data:' + imgObj.mimetype + ';base64,' + imgObj.data : imgObj.data;
                var elementImg = createDomElementFromModel(
                {
                    'name': 'img',
                    'attributes': {
                        'class': 'scanned',
                        'src': imgSrc,
                        'height': '100',
                        'class': 'zoom'
                    }
                }
            );
                domParent.appendChild(elementImg);
                // optional UI effect that allows the user to click the image to zoom.
                enableZoom();
            }
            function submitForm1() {
                displayStatus(true, "Submitting in progress, please standby ...", true);
                com_asprise_scan_submit_form_with_images('form1', imagesScanned, function(xhr) {
                    if(xhr.readyState == 4) { // 4: request finished and response is ready
                        displayStatus(false, "<h2>Response from the server: </h2>" + xhr.responseText, true);
                    }
                });
            }
        </script>

        <h2>HTML/JavaScript Web Scan Demo Using scanner.js</h2>

        <p style="color: #9eadc0;">For evaluation purpose only. Please order a license from <a href="http://asprise.com/" target=_blank>asprise.com</a>
            | <a href="https://github.com/Asprise/scanner.js/blob/master/scanner.js-demo.html" target="_blank">View source code of this page</a>
        </p>

        <div class="panel panel-info" style="margin: 20px 0px;">
            <div class="panel-heading">
                <h3 class="panel-title">This is a typical form:</h3>
            </div>
            <div class="panel-body">
                <form id="form1" action="http://asprise.com/scan/applet/upload.php?action=dump" method="POST" enctype="multipart/form-data" target="_blank" >
                    <label for="field1" style="display: inline-block; width: 150px; text-align: right;">Field 1</label>
                    <input id="field1" name="field1" type="text" value="value 1"/>
                    <br><span style="height: 4px;"></span><br>

                    <label style="display: inline-block; width: 150px; text-align: right;">Documents</label>
                    <button type="button" class="btn btn-default" onclick="scanSimple();">Simple Scan</button>
                    <button type="button" class="btn btn-info" onclick="scan();">Scan</button>
                    <button type="button" class="btn btn-default" onclick="scanThenUpload();">Scan Then Upload</button>


                    <button type="button" class="btn btn-default" onclick="scanAndSaveToLocal();" style="margin-left: 20px;">Scan and Save to Local Disk</button>

                    <div id="images" style="margin-left: 154px; margin-top: 10px;">
                    </div>

                    <input type="button" class="btn btn-primary" value="Submit form" onclick="submitForm1();" style="margin-left: 154px; margin-top: 20px;">
                </form>
            </div>
        </div>

        <div id="info" class="well" style="display: block; background-color: #fff; height: 500px; margin-top: 12px; padding: 12px; overflow: scroll;">
            <p><i>Information window</i></p>
        </div>

        <span style="font-family: Arial; color: #999; font-size: 12px;">ALL RIGHTS RESERVED BY LAB ASPRISE <a href="http://asprise.com/" target=_blank>asprise.com</a> &copy; 1998 - 2014.</span>

        <script src="http://yyx990803.github.io/zoomerang/zoomerang.js"></script>
        <script>
            function enableZoom() {
                Zoomerang.config({
                    maxWidth: window.innerWidth, // 400,
                    maxHeight: window.innerHeight, // 400,
                    bgColor: '#000',
                    bgOpacity: .85
                }).listen('.zoom');
            }
        </script>

    </a4j:form>

</f:subview>
