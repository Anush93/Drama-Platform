
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/tutorial-player.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <title>Drama.lk</title>
</head>
<body>
<div class="header">
    <jsp:include page="jspLayouts/defaultHeader.jsp" />
</div>
<input type="checkbox" id="menu-toggle" unchecked>
<div class="slide-menu">
    <jsp:include page="jspLayouts/slideMenu.jsp" />
</div>

<label class="menu-label" for="menu-toggle">
    <div class="menu-toggler">
        <span class="line"></span>
    </div>
</label>
<div class="content">
    <div class="player-wrapper">
        <div class="player">
            <video height="480" width="850" src="${playUrl}" controls = "controls" tabindex="0" autoplay="autoplay" poster="resourses/tutorial-thumbnails/poster.png" loop="loop"></video>
        </div>
        <div class="bottom-wrapper-left">
            <div class="video-title">${playDesc}</div>
            <div class="button-wrapper">
                <div class="views"><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 25K</div>
                <div class="unlike"><i class="fa fa-thumbs-down" aria-hidden="true"></i> &nbsp 120</div>
                <div class="like"><i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp 225K </div>

            </div>
            <div class="uploader">
                <div class="profile-image" style="background-image: url(${playProUrl});"></div>
                <div class="username">${playName}</div>
                <div class="follow-button">FOLLOW 12K</div>
            </div>
            <div class="comment-section">
                <div class="comments-title">Comments</div>
                <div class="comments-list">

                    <%
                        /*
                       // System.out.println("hihi");
                        try{
                            //JSONArray jsonArray = new JSONArray(session.getAttribute("playCommentList"));
                            //String[][] arrayOfArrays = new String[jsonArray.length()][];
                            //System.out.println(jsonArray.length());
                            System.out.println("okok");
                            //System.out.println(arrayOfArrays.length);
                            /*for (int i = 0; i < jsonArray.length(); i++) {
                                JSONArray innerJsonArray = (JSONArray) jsonArray.get(i);
                                String[] stringArray = new String[innerJsonArray.length()];
                                for (int j = 0; j < innerJsonArray.length(); j++) {
                                    stringArray[j] = innerJsonArray.get(j);
                                }
                                arrayOfArrays[i] = stringArray;
                            }*/

                            //ArrayList<Comment> comment = new ArrayList<Comment>(session.getAttribute("playCommentList"));
                            //System.out.println(outerObject.length());
                        /*for (int i = 0, size = outerObject.length(); i < size; i++)
                        {
                            JSONObject objectInArray = outerObject.getJSONObject(i);

                            // "...and get thier component and thier value."
                            String[] elementNames = JSONObject.getNames(objectInArray);
                            System.out.printf("%d ELEMENTS IN CURRENT OBJECT:\n", elementNames.length);
                            for (String elementName : elementNames)
                            {
                                String value = objectInArray.getString(elementName);
                                System.out.printf("name=%s, value=%s\n", elementName, value);
                            }
                            System.out.println();
                        }
                        }catch (Exception e){

                        }*/
                    %>


                    <div class="comment-wrapper">
                                <div class="comment-user-image"></div>
                                <div class="comment-user-desc">
                                    <div class="comment-username">Lahiru Hashan</div>
                                    <div class="comment">amzing Video</div>
                                </div>
                            </div>



                </div>
            </div>
        </div>
    </div>
    <div class="recommended-list">
        <div class="heading">Recommended Next</div>
        <div class="list-container"></div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/tutorial-player.js"></script>

</body>
</html>