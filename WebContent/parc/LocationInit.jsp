<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs!=null&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation!=null}" var="prcloc">

    <c:choose>

        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action>=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action<=3}" >
            <jsp:include flush="true" page="/parc/LocationFiche.jsp" />
        </c:when>
         <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==9}" >
            <jsp:include flush="true" page="/commun/listeTiers.jsp" />
        </c:when>
        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==10}">
            <jsp:include flush="true" page="/commun/listeParc.jsp" />
        </c:when>
        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==12}" >
            <jsp:include flush="true" page="/commun/ficheTiers.jsp" />
        </c:when>
        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==13}" >
            <jsp:include flush="true" page="/commun/ficheProduit.jsp" />
        </c:when>
        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==15}" >
            <jsp:include flush="true" page="/commun/listeProduitsVentes.jsp" />
        </c:when>
        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanParcs.formParcLocation.var_action==16}" >
            <jsp:include flush="true" page="/commun/ajouterContactTiers.jsp" />
        </c:when>

        <c:otherwise><jsp:include flush="true" page="/parc/LocationList.jsp" /></c:otherwise>

    </c:choose>

</c:if>