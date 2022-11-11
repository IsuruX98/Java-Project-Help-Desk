<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en-gb" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>User tickets</title>

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
    <div class="uk-section uk-section">
      <div class="uk-container uk-container-medium">
        <h1 class="uk-text-center uk-text-bolder">Ticket List</h1>
        <div class="uk-overflow-auto">
          <table
            class="uk-table uk-table-hover uk-table-divider uk-table-striped"
          >
          <thead class="uk-background-secondary">
              <tr>
              
					<th class="uk-table-expand uk-text-center">Ticket No</th>
                    <th class="uk-table-expand uk-text-center">Date</th>
                    <th class="uk-table-expand uk-text-center">Subject</th>
                    <th class="uk-table-expand uk-text-center"></th>
                
              </tr>
            </thead>
          
          <c:forEach var = "get" items = "${getAdminTicket}">
	
	          <c:set var ='id' value = '${get.ticketNo}'/>
	          <c:set var ='date' value = '${get.date}'/>
	          <c:set var ='name' value = '${get.name}'/>
	          <c:set var ='email' value = '${get.email}'/>
	          <c:set var ='id' value = '${get.id}'/>
	          <c:set var ='contact' value = '${get.contact}'/>
	          <c:set var ='subject' value = '${get.subject}'/>
	          <c:set var ='description' value = '${get.description}'/>



            
            <tbody>
              <tr>
               			<td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${get.ticketNo}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${get.date}</a>
                        </td>
                        <td class="uk-table-link">
                            <a class="uk-link-reset uk-text-center" href="">${get.subject}</a>
                        </td>

<%--     <c:url value = 'updateticket.jsp' var = 'updateticket'>
		<c:param name = 'tid' value = '${get.ticketNo}'/>
		<c:param name = 'date' value = '${get.date}'/>
		<c:param name = 'name' value = '${get.name}'/>
		<c:param name = 'email' value = '${get.email}'/>
		<c:param name = 'id' value = '${get.id}'/>
		<c:param name = 'contact' value = '${get.contact}'/>
		<c:param name = 'subject' value = '${get.subject}'/>
		<c:param name = 'description' value = '${get.description}'/>
	</c:url> --%>
	
	<c:url value = 'adminViewTIcket.jsp' var = 'deleteticket'>
		<c:param name = 'tid' value = '${get.ticketNo}'/>
		<c:param name = 'date' value = '${get.date}'/>
		<c:param name = 'name' value = '${get.name}'/>
		<c:param name = 'email' value = '${get.email}'/>
		<c:param name = 'id' value = '${get.id}'/>
		<c:param name = 'contact' value = '${get.contact}'/>
		<c:param name = 'subject' value = '${get.subject}'/>
		<c:param name = 'description' value = '${get.description}'/>
	</c:url>

         <%--        <td><a href='${updateticket}'><button class="uk-button uk-button-secondary uk-button-small">Edit</button></a></td> --%>
                <td><a href='${deleteticket}'><button class="uk-button-small uk-button-primary uk-border-rounded uk-width-1-1">View</button></a></td>
              </tr>
            </tbody>
          </c:forEach>
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

    <!-- footer ends -->
  </body>
</html>