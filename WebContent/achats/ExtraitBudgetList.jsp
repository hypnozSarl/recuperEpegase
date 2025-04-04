<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>

<f:subview id="cmdrextraitBudget">

    <center> <h2><h:outputText id="pgextrait" value="EXTRAIT DE BUDGET : #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.inputProjet}" styleClass="titre"/></h2></center>

    <a4j:form id="formPrinc" >
        <rich:hotKey key="return" handler="return false;"/>

        <h:panelGrid style="border:1px solid black;background-color:#FFFFFF;height:130px;" id="firstPanel" width="100%" columns="2" columnClasses="clos20,clos80">

            <h:panelGrid width="100%" cellpadding="1" cellspacing="0">
                <h:panelGrid id="panelgrp" width="100%" columns="3" style="text-align:center;">
                    <a4j:commandButton title="Recherche budget"image="/images/rechercher.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.trouverBudget}" reRender="panelExtrait"/>
                    <a4j:commandButton title="Imprime extrait" image="/images/print.png" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_affiche_bouton&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.menuachat.imp}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.initImpression}" reRender="panelImp,formModalImp,panchoixdoc,panelMail"/>
                    <a4j:commandButton title="Visualisation poste" image="/images/detail.png" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_affiche_bouton&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.menuachat.imp&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.budget.budType<='4'}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.visualisationPoste}" onclick="javascript:Richfaces.showModalPanel('modAttente');" reRender="panelDetailPiece,modAttente"/>
                </h:panelGrid>
            </h:panelGrid>

            <h:panelGrid width="100%" id="filtre">
                <h:panelGrid width="100%" id="periode">
                    <h:panelGrid width="100%" style="border:1px solid black;height:20px;text-align:center;font-weight:bold">
                        <h:column><h:outputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.periode}" /></h:column>
                    </h:panelGrid>
                </h:panelGrid>

                <h:panelGrid width="100%">
                    <h:panelGrid width="100%" columns="3" style="border:1px solid black;height:80px;" id="mvts" columnClasses="clos30,clos30,clos30">
                        <h:panelGrid headerClass="headerTab" style="margin-top:-2px" width="100%">
                            <f:facet name="header"><h:outputText  value="BUDGET"/></f:facet>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.totalBudget}" readonly="true" style="width:90%;text-align:right;background:transparent;border:0px;">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                        </h:panelGrid>
                        <h:panelGrid headerClass="headerTab" style="margin-top:-2px" width="100%">
                            <f:facet name="header"><h:outputText  value="REALISE"/></f:facet>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.totalRealise}" readonly="true" style="width:90%;text-align:right;background:transparent;border:0px;">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                        </h:panelGrid>
                        <h:panelGrid headerClass="headerTab" style="margin-top:-2px" width="100%">
                            <f:facet name="header"><h:outputText  value="ECART"/></f:facet>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.totalEcart}" readonly="true" style="width:90%;text-align:right;background:transparent;border:0px;">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                        </h:panelGrid>
                    </h:panelGrid>

                </h:panelGrid>
            </h:panelGrid>
        </h:panelGrid>
        <br>
        <a4j:region renderRegionOnly="false">
            <rich:datascroller renderIfSinglePage="false" pageIndexVar="pageIndex" pagesVar="pages" page="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.pageIndex}" reRender="tableExtrait" id="scrollTable" maxPages="20"align="left" for="tableExtrait"/>
            <rich:extendedDataTable rows="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_nb_max}" border="0" width="100%" noDataLabel=" " styleClass="bg" headerClass="headerTab" style="max-height:100%;border:solid 0px green;" id="tableExtrait" selectedClass="active-row" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.dataModelLesBudgets}" var="table" rowClasses="rows1,rows2,rowsd">
                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.selectionBudget}" reRender="panelgrp"/>
                <rich:column sortable="false" width="10%" >
                    <f:facet name="header"><h:outputText  value="Année"/></f:facet>
                    <h:outputText value="#{table.budAnnee}" style="#{table.espaceFamille}"/>
                </rich:column>
                <rich:column sortable="false" width="18%" >
                    <f:facet name="header"><h:outputText  value="Code"/></f:facet>
                    <h:outputText value="#{table.budCode}" style="#{table.espaceFamille}"/>
                </rich:column>
                <rich:column width="26%"  >
                    <f:facet name="header"><h:outputText  value="Libellé"/></f:facet>
                    <h:outputText value="#{table.budLibelleFr}" style="#{table.espaceFamille}"/>
                </rich:column >
                <rich:column style="text-align:right;" width="12%" >
                    <f:facet name="header"><h:outputText  value="Budget"/></f:facet>
                    <h:outputText value="#{table.varBudget}" rendered="#{table.varBudget!=0}" style="#{table.espaceFamille}">
                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                    </h:outputText>
                </rich:column>
                <rich:column style="text-align:right;" width="12%" >
                    <f:facet name="header"><h:outputText  value="Réalisé"/></f:facet>
                    <h:outputText value="#{table.varRealise}" rendered="#{table.varRealise!=0}" style="#{table.espaceFamille}">
                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                    </h:outputText>
                </rich:column>
                <rich:column style="text-align:right;" width="12%" >
                    <f:facet name="header"><h:outputText  value="Ecart"/></f:facet>
                    <h:outputText value="#{table.varEcart}" rendered="#{table.varEcart!=0}" style="#{table.espaceFamille}">
                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                    </h:outputText>
                </rich:column>
                <rich:column style="text-align:right;" width="10%" >
                    <f:facet name="header"><h:outputText  value="%"/></f:facet>
                    <h:outputText value="#{table.varPourcentage}" rendered="#{table.varPourcentage!=0}" style="#{table.espaceFamille}">
                        <f:convertNumber type="currency" groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2" currencySymbol="%"/>
                    </h:outputText>
                </rich:column>
            </rich:extendedDataTable>
        </a4j:region>

    </a4j:form>



    <rich:modalPanel domElementAttachment="parent"  id="panelExtrait" headerClass="headerPanel" styleClass="bg" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="300"  showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelBudget}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelBudget}" var="rec">
            <f:facet name="header"><h:outputText value="Recherche Budget"/></f:facet>
            <f:facet name="controls">
                <a4j:form>
                    <a4j:commandButton image="/images/close.gif" styleClass="hidelink" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.annulerBudget}" reRender="panelExtrait,filtre,tableExtrait,scrollTable" style="text-decoration:none;"/>
                </a4j:form>
            </f:facet>
            <a4j:form  id="Form" >
                <rich:hotKey key="return" handler="return false;"/>
                <rich:panel id="richpsupp"  style="width:100%;border:0px;">
                    <h:panelGrid border="0" columns="2" id="pgrd1"  width="100%" columnClasses="clos30,clos70">
                        <h:column><h:outputText  style="text-decoration:underline;" value="Période Budget:"/></h:column>
                        <h:column>
                            <h:selectOneMenu  id="idSelPeriode" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_annee}" title="Liste période" style="width:100%">
                                <f:selectItem itemLabel="Sélectionnez Période" itemValue=""/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.mesAnneeItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Date Début (JJ/MM/AAAA):"/></h:column>
                        <h:column><rich:calendar style=" background-color:white;" locale="FR" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.dateDebut}"  enableManualInput="true" datePattern="dd/MM/yyyy"  inputSize="17" /></h:column>
                        <h:column><h:outputText value="Date Fin (JJ/MM/AAAA):"/></h:column>
                        <h:column><rich:calendar style=" background-color:white;" locale="FR" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.dateFin}"  enableManualInput="true" datePattern="dd/MM/yyyy"  inputSize="17" /></h:column>
                        <h:column><h:outputText  style="text-decoration:underline;" value="Sélection Budget:"/></h:column>
                        <h:column>
                            <h:selectOneMenu  id="idSelBudget" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_nature}" title="Liste budget" style="width:100%">
                                <f:selectItem itemLabel="Sélectionnez Budget" itemValue=""/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.mesTypesItems}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.calculeEntite}" reRender="pgrd1,idSelEntite"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.afficheEntite}"><h:outputText  style="text-decoration:underline;" value="Sélection Entité:"/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.afficheEntite}">
                            <h:selectOneMenu  id="idSelEntite" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_entite}" title="Liste entités" style="width:100%">
                                <f:selectItem itemLabel="Sélectionnez Entité" itemValue=""/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.mesEntitesItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText  style="text-decoration:underline;" value="Sélection Réaménagement:"/></h:column>
                        <h:column>
                            <h:selectOneMenu  id="idSelReamenagment" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_choix_reamenagement}" title="Liste réaménagement" style="width:100%">
                                <f:selectItem itemLabel="Réaménagement Initial" itemValue="0"/>
                                <f:selectItem itemLabel="Réaménagement N° 1" itemValue="1"/>
                                <f:selectItem itemLabel="Réaménagement N° 2" itemValue="2"/>
                                <f:selectItem itemLabel="Réaménagement N° 3" itemValue="3"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br><br>
                    <h:panelGroup id="buttFind">
                        <center>
                            <h:commandButton  image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.recherche}" id="idValRec" onclick="javascript:Richfaces.showModalPanel('modAttente');"/>
                        </center>
                    </h:panelGroup>
                </rich:panel>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelDetailPiece" width="1200" height="450" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelDetailPiece}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelDetailPiece}" var="det">
            <f:facet name="header"><h:outputText value="Visualisation du poste #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.budget.budCode} : #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.budget.budLibelleFr}"></h:outputText></f:facet>
            <f:facet name="controls">
                <a4j:form>
                    <a4j:commandButton action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.fermerDetailPoste}" image="/images/close.gif" styleClass="hidelink" reRender="panelDetailPiece"/>
                </a4j:form>
            </f:facet>
            <a4j:form  id="FormPiece">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" style="text-align:left;">
                    <h:panelGrid id="panTotalExtrait" width="100%" columns="6" columnClasses="clos12d,clos21g,clos12d,clos21g,clos12d,clos21g" styleClass="fichefournisseur1">
                        <h:column><h:outputText value="Total débit:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_tot_debit}" style="text-align:right;" readonly="true">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>
                        <h:column><h:outputText value="Total crédit:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_tot_credit}" style="text-align:right;" readonly="true">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>
                        <h:column><h:outputText value="Solde:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.var_solde}" style="text-align:right;" readonly="true">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <a4j:region renderRegionOnly="false">
                        <rich:extendedDataTable id="pclisteId"  height="350px" width="100%" headerClass="headerTab" selectedClass="active-row" var="detCmd" style="border:solid 0px green;cursor:pointer;" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.dataModelLesBudgetsLigne}" >
                            <rich:column width="5%" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recNum}" label="N° Commande">
                                <f:facet name="header"><h:outputText  value="N° REC." /></f:facet>
                                <h:outputText value="#{detCmd.receptionEnteteAchats.recNum}">
                                </h:outputText>
                            </rich:column>
                            <rich:column width="7%" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recDate}" label="Date de saisie">
                                <f:facet name="header"><h:outputText  value="Date" /></f:facet>
                                <h:outputText value="#{detCmd.receptionEnteteAchats.recDate}">
                                    <f:convertDateTime pattern="dd/MM/yy"/>
                                </h:outputText>
                            </rich:column>
                            <rich:column width="21%" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recNomTiers}" label="Nom du tiers">
                                <f:facet name="header"><h:outputText  value="Tiers"  /></f:facet>
                                <h:outputText value="#{detCmd.receptionEnteteAchats.recNomTiers}" >
                                </h:outputText>
                            </rich:column>
                            <rich:column  width="9%" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recBudgetEntite}" label="Entité">
                                <f:facet name="header"><h:outputText  value="entité"/></f:facet>
                                <h:outputText value="#{detEcr.receptionEnteteAchats.recBudgetEntite}" >
                                </h:outputText>
                            </rich:column>
                            <rich:column  width="9%" sortable="true" sortBy="#{detCmd.recligCode}" label="Poste">
                                <f:facet name="header"><h:outputText  value="Produit"/></f:facet>
                                <h:outputText value="#{detEcr.recligCode}" >
                                </h:outputText>
                            </rich:column>
                            <rich:column width="10%"  style="text-align:right;" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recTotTtc}"label="Qte">
                                <f:facet name="header"><h:outputText  value="Qte." /></f:facet>
                                <h:outputText value="#{detCmd.recligQte}" rendered="#{detCmd.recligQte!=0}" >
                                </h:outputText>
                            </rich:column>
                            <rich:column width="10%" style="text-align:right;" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recTotHt}" label="H.T." rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.optionAchats.modCalcPr=='0'}">
                                <f:facet name="header"><h:outputText  value="H.T." /></f:facet>
                                <h:outputText   value="#{detCmd.recligPt}" rendered="#{detCmd.recligPt!=0}">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:outputText>
                            </rich:column>
                            <rich:column width="10%"  style="text-align:right;" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recTotTtc}"label="T.T.C." rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.optionAchats.modCalcPr=='1'}">
                                <f:facet name="header"><h:outputText  value="T.T.C." /></f:facet>
                                <h:outputText value="#{detCmd.recligTtc}" rendered="#{detCmd.recligTtc!=0}" >
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:outputText>
                            </rich:column>
                            <rich:column width="26%" sortable="true" sortBy="#{detCmd.receptionEnteteAchats.recObject}" label="Objet">
                                <f:facet name="header"><h:outputText value="Objet" /></f:facet>
                                <h:outputText value="#{detCmd.receptionEnteteAchats.recObject}" >
                                </h:outputText>
                            </rich:column>
                        </rich:extendedDataTable>
                    </a4j:region>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelImp" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="650" height="350" autosized="true" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelPrint}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanAchats.formExtraitBudget.showModalPanelPrint}" var="prt">
            <jsp:include flush="true" page="/commun/impressionExploitationAchats.jsp"/>
        </c:if>
    </rich:modalPanel>


</f:subview>
