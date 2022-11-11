<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!-- importing the tag library connection -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Contact Us List</title>

    <!-- UIkit CSS -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/css/uikit.min.css"
    />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit-icons.min.js"></script>
</head>

<body>

<!-- status from util class -->
<input type="hidden" id="status" value="<%= request.getAttribute(" status")%>">

<!-- header -->

<header>
      <div
        class="uk-background-secondary"
        uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky"
      >
        <nav class="uk-navbar-container uk-navbar-transparent">
          <div class="uk-container">
            <div data-uk-navbar>
              <div class="uk-navbar-left">
                <a
                  class="uk-navbar-item uk-logo uk-visible@m uk-text-muted uk-text-bold uk-text-bolder"
                  href="adminHome.jsp"
                  >Help Desk Admin</a
                >
              </div>
              <div class="uk-navbar-center uk-hidden@m">
                <a
                  class="uk-navbar-item uk-logo uk-text-muted uk-text-bold"
                  href="adminHome.jsp"
                  >Help Desk Admin</a
                >
              </div>
              <div class="uk-navbar-right">
                <ul class="uk-navbar-nav uk-visible@m">
                  <li><a href="adminHome.jsp">Home</a></li>
                  
                  <li>
                    <div class="uk-navbar-item">
                      <%
					if(session.getAttribute("name")==null){
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"login.jsp\">Login</a>");
					}else{
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"acc.jsp\">");
						%>
						<%= session.getAttribute("name")%>
						 <%
						out.print("</a>");
					}
					%>
                    </div>
                  </li>
                </ul>
                <a
                  class="uk-navbar-toggle uk-hidden@m"
                  href="#offcanvas"
                  data-uk-toggle
                  ><span data-uk-navbar-toggle-icon></span>
                  <span class="uk-margin-small-left">Menu</span></a
                >
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>

<!-- header ends -->

<input type="hidden" id="status" value="<%= request.getAttribute(" status")%>">

<div class="uk-section uk-section">
    <div class="uk-container uk-container-medium">
        <h1 class="uk-text-center uk-text-bolder">User Message List</h1>
        <div class="uk-overflow-auto">
            <table class="uk-table uk-table-hover uk-table-divider uk-table-striped">
                <thead class="uk-background-secondary">
                <tr>
                    <th class="uk-table-expand uk-text-center">User Id</th>
                    <th class="uk-table-shrink uk-text-center">User Name</th>
                    <th class="uk-table-shrink uk-text-center">User Email</th>
                    <th class="uk-table-expand uk-text-center">Subject</th>
                    <th class="uk-table-expand uk-text-center">Message</th>
                    <th class="uk-table-shrink uk-text-center">Reply</th>
                </tr>
                </thead>
                <tbody>
                <!-- looping the user data using c tag library -->

                <c:forEach var="msg" items="${clist}">

                    <!-- storing the user data into variables -->
                    <c:set var="id" value="${msg.cid}"/>
                    <c:set var="name" value="${msg.cname}"/>
                    <c:set var="email" value="${msg.cemail}"/>
                    <c:set var="subject" value="${msg.csubject}"/>
                    <c:set var="message" value="${msg.cmessage}"/>

                    <tr>
                        
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${msg.cid}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${msg.cname}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${msg.cemail}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${msg.csubject}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset" href="">${msg.cmessage}</a>
                        </td>
                        <td>
                            <form action="https://formspree.io/f/xrgdrdgk" method="post">
							
							<input type="hidden" name="email" value="${msg.cemail}">
							
							<input
                      		class="uk-button-small uk-button-primary uk-border-rounded uk-width-1-1"
                      		type="submit"
                      		value="Send Reply"
                    		/>
							</form>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- responsive menu -->

    <div id="offcanvas" data-uk-offcanvas="flip: true; overlay: true">
      <div class="uk-offcanvas-bar">
        <a class="uk-logo" href="adminHome.html">Help Desk Admin</a>
        <button class="uk-offcanvas-close" type="button" data-uk-close></button>
        <ul
          class="uk-nav uk-nav-primary uk-nav-offcanvas uk-margin-top uk-text-center uk-text-small"
        >
          <li><a href="adminHome.jsp">Home</a></li>
                  
                  <li>
                    <div class="uk-navbar-item">
                      <%
					if(session.getAttribute("name")==null){
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"login.jsp\">Login</a>");
					}else{
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"acc.jsp\">");
						%>
						<%= session.getAttribute("name")%>
						 <%
						out.print("</a>");
					}
					%>
                    </div>
                  </li>
        </ul>
        <div class="uk-margin-top uk-text-center">
          <div
            data-uk-grid
            class="uk-child-width-auto uk-grid-small uk-flex-center"
          >
            <div>
              <a
                href="https://twitter.com/"
                data-uk-icon="icon: twitter"
                class="uk-icon-link"
                target="_blank"
              ></a>
            </div>
            <div>
              <a
                href="https://www.facebook.com/"
                data-uk-icon="icon: facebook"
                class="uk-icon-link"
                target="_blank"
              ></a>
            </div>
            <div>
              <a
                href="https://www.instagram.com/"
                data-uk-icon="icon: instagram"
                class="uk-icon-link"
                target="_blank"
              ></a>
            </div>
            <div></div>
          </div>
        </div>
      </div>
    </div>

    <!-- responsive menu ends -->

    <!-- footer -->

    <footer
      class="uk-section uk-background-secondary uk-text-center uk-text-muted"
    >
      <div class="uk-container uk-container-small">
        <div>
          <ul class="uk-subnav uk-flex-center">
            <li><a href="index.jsp">Home</a></li>
            
          </ul>
        </div>
        <div class="uk-margin-medium">
          <div
            data-uk-grid
            class="uk-child-width-auto uk-grid-small uk-flex-center"
          >
            <div class="uk-first-column">
              <a
                href="https://twitter.com/"
                data-uk-icon="icon: twitter"
                class="uk-icon-link uk-icon"
                target="_blank"
              ></a>
            </div>
            <div>
              <a
                href="https://www.facebook.com/"
                data-uk-icon="icon: facebook"
                class="uk-icon-link uk-icon"
                target="_blank"
              ></a>
            </div>
            <div>
              <a
                href="https://www.instagram.com/"
                data-uk-icon="icon: instagram"
                class="uk-icon-link uk-icon"
                target="_blank"
              ></a>
            </div>
          </div>
        </div>
        <div class="uk-margin-medium uk-text-small uk-link-muted">
          &copy; Copyright Help desk. All Rights Reserved
        </div>
      </div>
    </footer>

    <!-- footer ends -->

<!-- JS alert for registration is done -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>

<script type="text/javascript">

    var status = document.getElementById("status").value;
    if (status == "failed") {
        swal("Sorry", "wrong username or password", "error");
    } else if (status == "invalidemail") {
        swal("Sorry", "Please Enter Username", "error");
    } else if (status == "invalidupwd") {
        swal("Sorry", "Please Enter Password", "error");
    } else if (status == "updatedone") {
        swal("Done", "profile updated successfully please relogin", "success");
    }
</script>

</body>
</html>
