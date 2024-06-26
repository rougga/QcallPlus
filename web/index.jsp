<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="main.PgConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr" >
    <head>
        <meta charset="utf-8"/>
        <title>Connexion - <%= CfgHandler.APP%></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/lib/jquery.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/lib/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/index2.css" >
        <link rel="icon" type="image/png" href="./img/favicon-32x32.png">
        <script src="./js/script.js"></script>
        <script src="./js/login.js"></script>
    </head>
    <body>
        <div class="modal-dialog text-center">
            <div class="alert alert-danger alert-dismissible fade show m-4" role="alert" id="err">
                <strong id="errText"></strong>
                <button type="button" class="close" id="errClose" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <img src="img/fav.png" />
                    </div>
                    <form action="" method="POST" class="col-12">
                        <label class="badge badge-pill badge-light font-weight-bold">Connexion  à Qcall+:</label>
                        <div class="form-group" id="user-group">
                            <input type="text" id="username" class="form-control" placeholder="Nom d'utilisateur"/>
                        </div>
                        <div class="form-group" id="contrasena-group">
                            <input class="form-control" placeholder="Mot de passe" type="password" id="password"/>
                        </div>
                        <div class="form-group">
                            <label for="selectWindowSelect" class="text-white font-weight-bold">Sélectionner Guichet: </label>
                            <br>
                            <select class="form-control" id="selectWindowSelect">
                                <%
                                    try {

                                        PgConnection con = new PgConnection();
                                        ResultSet r = con.getStatement().executeQuery("select id,name,win_number,status from t_window where status = 1 order by win_number;");
                                        while (r.next()) {
                                %>
                                <option value="<%=r.getString("id")%>"><%=r.getString("name")%></option>
                                <%

                                    }
                                } catch (ClassNotFoundException | SQLException ex) {
                                %> <script>console.log("SERVER: <%= ex.getMessage()%>");</script> <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">   
                            <input type="hidden" id="window" name="window"/>
                            <input type="hidden" name="windowText" id="windowText"/>
                            <input type="hidden" id="branchId" name="branchId" class="form-control"/>
                        </div>



                        <button type="button" id="submit2"  class="btn btn-success text-white"><img src="img/login.png" alt=""/>  CONNECTER </button>

                        <a href="#" id="settingsBtn" class="btn btn-primary"><img src="img/setting.png" alt=""/></a>
                    </form>
                </div>
                <div class="col-12 forgot">
                    <a href="#">Mot de passe oublié ?</a>
                </div>

            </div>

            <div>
                <%@include file="addon/footer.jsp" %>
            </div>
        </div>
    </div>
</body>
</html>
