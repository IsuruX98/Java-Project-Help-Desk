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
                                href="index.jsp"
                        >Help Desk</a
                        >
                    </div>
                    <div class="uk-navbar-center uk-hidden@m">
                        <a
                                class="uk-navbar-item uk-logo uk-text-muted uk-text-bold"
                                href="index.jsp"
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

    <div
            class="uk-section-large uk-position-relative uk-position-z-index uk-background-fixed uk-light"
            style="background-image: url(img/home.jpg)"
    >
        <div
                class="uk-container"
                data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true"
        >
            <h1 class="uk-text-center uk-margin-remove-top uk-text-bolder">
                Welcome to Online Help Desk
            </h1>
            <h3 class="uk-text-center uk-margin-remove-top">
                Better solutions for your problems
            </h3>
        </div>
    </div>
</header>

<!-- header ends -->

<!-- status from java class -->
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<input type="hidden" id="ticket" value="<%= request.getAttribute("ticket")%>">
<input type="hidden" id="deleteticket" value="<%= request.getAttribute("deleteticket")%>">


<!-- About us -->
<div class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-text-center">About Us</h2>
        <p class="uk-text-muted uk-text-center">
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maiores
            quaerat nihil delectus sequi! Quas, reiciendis provident natus quidem
            dolorum voluptatum autem magnam. Ipsum dolor facere nihil sapiente
            sunt porro earum.
        </p>
    </div>
</div>

<!-- About us ends -->

<!-- services -->

<div class="uk-section uk-section-muted">
    <div class="uk-container">
    <h2 class="uk-text-center">Services</h2>
        <div
                class="uk-child-width-1-2@m uk-grid-match- uk-grid-small"
                data-uk-grid
        >
            <!-- service 01 -->

            <div>
                <div
                        class="uk-card uk-card uk-card-default uk-card-hover uk-card-body uk-inline uk-border-rounded"
                >
                    <a class="uk-position-cover" href="#"></a>
                    <div class="uk-grid-small" data-uk-grid>
                        <div
                                class="uk-width-auto uk-text-primary uk-flex uk-flex-middle"
                        >
                            <span data-uk-icon="icon: cog; ratio: 2.6"></span>
                        </div>
                        <div class="uk-width-expand">
                            <h3 class="uk-card-title uk-margin-remove uk-text-primary">
                                Add tickets
                            </h3>
                            <p class="uk-text-muted uk-margin-remove">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Tempore ducimus cumque, id nesciunt sapiente error ad, quos
                                pariatur
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- service 01 ends -->

            <!-- service 02 -->

            <div>
                <div
                        class="uk-card uk-card uk-card-default uk-card-hover uk-card-body uk-inline uk-border-rounded"
                >
                    <a class="uk-position-cover" href="#"></a>
                    <div class="uk-grid-small" data-uk-grid>
                        <div
                                class="uk-width-auto uk-text-primary uk-flex uk-flex-middle"
                        >
                            <span data-uk-icon="icon: cog; ratio: 2.6"></span>
                        </div>
                        <div class="uk-width-expand">
                            <h3 class="uk-card-title uk-margin-remove uk-text-primary">
                                View Articles
                            </h3>
                            <p class="uk-text-muted uk-margin-remove">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Tempore ducimus cumque, id nesciunt sapiente error ad, quos
                                pariatur
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- service 02 ends -->

            <!-- service 03 -->

            <div>
                <div
                        class="uk-card uk-card uk-card-default uk-card-hover uk-card-body uk-inline uk-border-rounded"
                >
                    <a class="uk-position-cover" href="#"></a>
                    <div class="uk-grid-small" data-uk-grid>
                        <div
                                class="uk-width-auto uk-text-primary uk-flex uk-flex-middle"
                        >
                            <span data-uk-icon="icon: cog; ratio: 2.6"></span>
                        </div>
                        <div class="uk-width-expand">
                            <h3 class="uk-card-title uk-margin-remove uk-text-primary">
                                Look For FAQs
                            </h3>
                            <p class="uk-text-muted uk-margin-remove">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Tempore ducimus cumque, id nesciunt sapiente error ad, quos
                                pariatur
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- service 03 ends -->

            <!-- service 04 -->

            <div>
                <div
                        class="uk-card uk-card uk-card-default uk-card-hover uk-card-body uk-inline uk-border-rounded"
                >
                    <a class="uk-position-cover" href="#"></a>
                    <div class="uk-grid-small" data-uk-grid>
                        <div
                                class="uk-width-auto uk-text-primary uk-flex uk-flex-middle"
                        >
                            <span data-uk-icon="icon: cog; ratio: 2.6"></span>
                        </div>
                        <div class="uk-width-expand">
                            <h3 class="uk-card-title uk-margin-remove uk-text-primary">
                                Contact Our Team
                            </h3>
                            <p class="uk-text-muted uk-margin-remove">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Tempore ducimus cumque, id nesciunt sapiente error ad, quos
                                pariatur
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- service 04 ends -->
        </div>
    </div>
</div>

<!-- services ends -->

<!-- Submit a Ticket -->
<div class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-text-center">Submit a Ticket</h2>
        <p class="uk-text-muted uk-text-center">
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maiores
            quaerat nihil delectus sequi! Quas, reiciendis provident natus quidem
            dolorum voluptatum autem magnam. Ipsum dolor facere nihil sapiente
            sunt porro earum.
        </p>

        <!-- Submit a Ticket button -->

        <div
                class="uk-margin-medium-top uk-text-center"
                data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true"
        >
            <a class="uk-button uk-button-primary uk-border-rounded" href="addticket.jsp"
            >Submit a Ticket</a
            >
        </div>
    </div>
</div>

<!-- Submit a Ticket ends -->

<!-- Frequently asked questions -->

<div class="uk-section uk-section-muted" id="faq">
    <div class="uk-container uk-container-small">
        
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="userViewFAQ.jsp"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-primary uk-text-center">
                                <span data-uk-icon="icon: question; ratio: 1.5"></span>  Frequently asked questions
                            </h3>
            </div>
    </div>
</div>

<!-- Frequently asked questions ends -->

<!-- Contact us -->
<div class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-text-center">Didn't find an answer?</h2>
        <p class="uk-text-muted uk-text-center">
            Our team is just an email away and ready to answer your questions
        </p>

        <!-- contact us button -->

        <div
                class="uk-margin-medium-top uk-text-center"
                data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true"
        >
            <a
                    class="uk-button uk-button-primary uk-border-rounded"
                    href="contactUs.jsp"
            >Contact Us</a
            >
        </div>
    </div>
</div>

<!-- Contact us ends -->

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
<!-- JS alert for registration is done -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>

<script type="text/javascript">

    var status = document.getElementById("status").value;
    if (status == "contactusdone") {
        swal("Success", "we will contact you via e-mail", "success");
    }
    var ticket = document.getElementById("ticket").value;
    if (ticket == "ticketadded") {
        swal("Success", "your ticket has been submitted successfully.", "success");
    }
    var deleteticket = document.getElementById("deleteticket").value;
    if (deleteticket == "deleted") {
        swal("Success", "your ticket has been deleted successfully.", "success");
    }

</script>

</body>
</html>
