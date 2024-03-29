<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>

 
    <spring:url value="/js/jquery-1.12.1.min.js"     var="jqueryJs" />
        <script src="${jqueryJs}"></script>
        
    <spring:url value="/js/jquery.dataTables.js"     var="datatable" />
        <script src="${datatable}"></script>
        
    <spring:url value="/css/jquery.dataTables.css" var="jquerydataTables" />
        <link href="${jquerydataTables}" rel="stylesheet" />
        
    <spring:url value="/css/jquery.dataTables.min.css" var="jquerydataTablesMin" />
        <link href="${jquerydataTablesMin}" rel="stylesheet" />
        
    <spring:url value="/css/common.css" var="common" />
        <link href="${common}" rel="stylesheet" />