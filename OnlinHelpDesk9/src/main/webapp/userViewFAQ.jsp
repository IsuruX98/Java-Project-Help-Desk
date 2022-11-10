<%@page import="com.mysql.cj.Session"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!-- importing the tag library connection -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Help Desk</title>

    <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700&display=swap"
            rel="stylesheet"
    />

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
                                href="index.html"
                        >Help Desk</a
                        >
                    </div>
                    <div class="uk-navbar-center uk-hidden@m">
                        <a
                                class="uk-navbar-item uk-logo uk-text-muted uk-text-bold"
                                href="index.html"
                        >Help Desk</a
                        >
                    </div>
                    <div class="uk-navbar-right">
                        <ul class="uk-navbar-nav uk-visible@m">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">View Articles</a></li>
                            <li><a href="#faq">FAQ</a></li>
                            <li><a href="contactUs.jsp">Contact Us</a></li>
                            <li>

                                <div class="uk-navbar-item">
                                
									<!-- check for the user type -->
                                    
                                    <%
                                    if(session.getAttribute("name")==null){
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\"href=\"login.jsp\">Login</a>");                                    
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


<!-- Frequently asked questions -->

<div class="uk-section uk-section-muted" id="faq">
    <div class="uk-container uk-container-small">
        <h2 class="uk-text-center uk-margin-medium-top uk-text-bolder">Frequently asked questions</h2>
        <ul class="uk-margin-medium-top" data-uk-accordion="multiple: true">
            <li>
                <a
                        class="uk-accordion-title uk-box-shadow-hover-small uk-card-small uk-card-body uk-card-default"
                        href="#"
                >Question</a
                >
                <div class="uk-article-content uk-accordion-content link-primary">
                    <p>
                        question eka visadana vidiya gana podi hallak liyala mekata danna ona
                    </p>
                </div>
            </li>
        </ul>
    </div>
    <br>
<br>
<br>
<br>
</div>


<!-- Frequently asked questions ends -->


<!-- responsive menu -->

<div id="offcanvas" data-uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar">
        <a class="uk-logo" href="index.html">Help Desk</a>
        <button class="uk-offcanvas-close" type="button" data-uk-close></button>
        <ul
                class="uk-nav uk-nav-primary uk-nav-offcanvas uk-margin-top uk-text-center uk-text-small"
        >
            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">View Articles</a></li>
                            <li><a href="#faq">FAQ</a></li>
                            <li><a href="contactUs.jsp">Contact Us</a></li>
                            <li>

                                <div class="uk-navbar-item">
                                
									<!-- check for the user type -->
                                    
                                    <%
                                    if(session.getAttribute("name")==null){
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\"href=\"login.jsp\">Login</a>");                                    
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
                <li><a href="#faq">FAQ</a></li>
                <li><a href="#">View Articles</a></li>
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


</body>
</html>
